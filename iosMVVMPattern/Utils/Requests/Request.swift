//
//  Request.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
import Alamofire

class Request {
	
	static let mockImageName = "image.jpg"
	static let shared = Request()
	
	// Make our constructor private to make class singleton
	private init() { }
	
	func asDictionary<EncodableValue: Encodable>(data: EncodableValue) throws -> [String: Any] {
		let data = try JSONEncoder().encode(data)
		guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
			throw NSError()
		}
		return dictionary
	}
	
	func appendImage(_ image: UIImage?, toMulripart mulipart: MultipartFormData, withName name: String) {
		
		guard let image = image, let data = image.jpegData(compressionQuality: 0) else {
			return
		}
		
		mulipart.append(data, withName: name)
	}
}
