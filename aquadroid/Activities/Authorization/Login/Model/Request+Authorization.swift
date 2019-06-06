//
//  Request+Authorization.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

extension Request {
	
	func loginRequest(credentials: Credentials) -> Observable<BaseResponse<AuthorizationResponse>> {
		
		return RequestCreator.Builder(AutorizationURL.login)
			.parameters([AutorizationURL.email: credentials.email, AutorizationURL.password: credentials.password])
			.build()
			.createRequest(responseType: BaseResponse<AuthorizationResponse>.self)
		
	}
	
	func registerRequest(credentials: Credentials) -> Observable<BaseResponse<AuthorizationResponse>> {
		
		guard let dict = try? asDictionary(data: credentials) else {
			return Observable.error(NSError())
		}
		
		return RequestCreator.Builder(AutorizationURL.register)
			.parameters(dict)
			.method(.post)
			.encoding(JSONEncoding.default)
			.build()
			.createRequest(responseType: BaseResponse<AuthorizationResponse>.self)
		
	}
	
	func restoreRequest(email: String) -> Observable<BaseResponse<Bool>> {
		
		return RequestCreator.Builder(AutorizationURL.restore)
			.parameters([AutorizationURL.email: email])
			.build()
			.createRequest(responseType: BaseResponse<Bool>.self)
		
	}
	
	func updatePasswordRequest(requestData: UpdatePasswordRequest) -> Observable<BaseResponse<Bool>> {
		
		guard let dict = try? asDictionary(data: requestData) else {
			return Observable.error(NSError())
		}
		
		return RequestCreator.Builder(AutorizationURL.updatePassword)
			.parameters(dict)
			.method(.post)
			.encoding(JSONEncoding.default)
			.build()
			.createRequest(responseType: BaseResponse<Bool>.self)
		
	}
	
	func refreshTokenRequest(token: String) -> Observable<BaseResponse<AuthorizationResponse>> {
		
		return RequestCreator.Builder(AutorizationURL.refreshToken)
			.parameters([AutorizationURL.accessToken: token])
			.build()
			.createRequest(responseType: BaseResponse<AuthorizationResponse>.self)
		
	}
	
	func verifyEmailRequest() -> Observable<BaseResponse<Bool>> {
		
		return RequestCreator.Builder(AutorizationURL.verifyEmail)
			.build()
			.createRequest(responseType: BaseResponse<Bool>.self)
	}
	
}
