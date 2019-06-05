//
//  RequestCreator.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire
import MobileCoreServices

class RequestCreator {

	let delay = 500
	let domain = Request.DomainsURL.domain
	
	var headers: [String: String] {
		
		var temp = [String: String]()
		temp[R.string.requests.audience()] = "iOS"
		temp[R.string.requests.userAgent()] = String(UIDevice().type, UIDevice.current.systemVersion, UIDevice.current.identifierForVendor!.uuidString)
		
		if AuthorizationHelper.shared().isAuthorized(), let token = AuthorizationHelper.shared().getStringToken() {
			temp[R.string.requests.authorization()] = token
		}
		
		return temp
	}
	
	fileprivate var address: String
	fileprivate var parameters: [String: Any]
	fileprivate var method: HTTPMethod
	fileprivate var encoding: ParameterEncoding
	
	fileprivate init(address: String, parameters: [String: Any], method: HTTPMethod, encoding: ParameterEncoding) {
		self.address = address
		self.parameters = parameters
		self.method = method
		self.encoding = encoding
	}
	
	class Builder {
		
		fileprivate var address: String
		fileprivate var parameters = [String: Any]()
		fileprivate var method = HTTPMethod.get
		fileprivate var encoding: ParameterEncoding = URLEncoding.default
		
		init(_ address: String) {
			self.address = address
		}
		
		func parameters(_ parameters: [String: Any]) -> Builder {
			self.parameters = parameters
			return self
		}
		
		func method(_ method: HTTPMethod) -> Builder {
			self.method = method
			return self
		}
		
		func encoding(_ encoding: ParameterEncoding) -> Builder {
			self.encoding = encoding
			return self
		}
		
		func build() -> RequestCreator {
			return RequestCreator.init(address: address, parameters: parameters, method: method, encoding: encoding)
		}
	}
	
	/// Universal function for all types of default requests
	/// Before usage you MUST setup address: String and CAN setup - mehod: HTTPMEthod,
	/// Encoding: ParametersEncoding, Parameters: [String: Any]
	///
	/// - Parameter responseType: You need to pass Decodable Model what describes Server response
	/// - Returns: return single observerable with server response on success or observable with error if something went wrong
	func createRequest<ResponseType: Decodable>(responseType: ResponseType.Type) -> Observable<ResponseType> {
		
		return requestData(method, "\(domain)\(address)", parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { (arg) -> Observable<ResponseType> in
				do {
					
					//          DEBUG OUTPUT
					debugPrint(arg.1)
					print(try JSONSerialization.jsonObject(with: arg.1, options: []) as? [String: Any] ?? R.string.localizable.decodingError())
					
					return try Observable.just(JSONDecoder().decode(ResponseType.self, from: arg.1))
				} catch let error {
					debugPrint(error)
					return Observable.error(error)
				}
			}
			.catchError { error in return Observable.error(error)}
			.delay(RxTimeInterval.milliseconds(delay), scheduler: MainScheduler.instance)
		
	}
	
	/// Universal function for all types of request with mulripart data
	/// Before usage you MUST setup addres: String
	///
	/// - Parameter responseType: You need to pass Decodable Model what describes Server response
	/// - Returns: return single observerable with server response on success or observable with error if something went wrong
	func createMultipartRequest<ResponseType: Decodable>(
		responseType: ResponseType.Type,
		data: @escaping (MultipartFormData) -> Void)  -> Observable<ResponseType> {
		
		return Observable<ResponseType>.create { observer in
			
			Alamofire.upload(
				multipartFormData: data,
				to: "\(self.domain)\(self.address)",
				headers: self.headers,
				encodingCompletion: { encodingResult in
					switch encodingResult {
					case .success(let upload, _, _):
						upload.responseData { dataResponse in
							
							debugPrint(dataResponse)
							if let data = dataResponse.data {
								
								do {
									print(try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? R.string.localizable.decodingError())
									return try observer.onNext(JSONDecoder().decode(ResponseType.self, from: data))
								} catch let error {
									debugPrint(error)
									return observer.onError(error)
								}
							} else {
								return observer.onError(dataResponse.error!)
							}
						}
					case .failure(let encodingError):
						print(encodingError)
					}
			})
			return Disposables.create()
			}
			.catchError { error in return Observable.error(error)}
			.delay(RxTimeInterval.milliseconds(delay), scheduler: MainScheduler.instance)
	}
	
}
