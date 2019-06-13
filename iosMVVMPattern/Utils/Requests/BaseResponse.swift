//
//  BaseResponse.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

struct BaseResponse<ResponseType: Codable>: Codable {
	let code: Int?
	let errors: [String]?
	let message: String?
	let response: ResponseType?
	let status: String?
	
	public init(code: Int? = nil,
							errors: [String]? = nil,
							message: String? = nil,
							response: ResponseType? = nil,
							status: String? = nil) {
		self.code = code
		self.errors = errors
		self.message = message
		self.response = response
		self.status = status
	}
}
