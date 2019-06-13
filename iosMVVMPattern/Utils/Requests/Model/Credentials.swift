//
//  Credentials.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

struct Credentials: Equatable, Codable {
	var email: String
	var password: String
	
	static func == (lhs: Credentials, rhs: Credentials) -> Bool {
		return lhs.email == rhs.email && lhs.password == rhs.password
	}
	
	init(email: String = "",
			 password: String = "") {
		self.email = email
		self.password = password
	}
}
