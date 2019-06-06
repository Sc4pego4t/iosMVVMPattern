//
//  AuthorizationResponse.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

import RealmSwift

class AuthorizationResponse: Codable {
	
	var accessToken: String = ""
	var header: Header = Header()
	var payload: Payload = Payload()
	
	init(accessToken: String = "",
			 header: Header = Header(),
			 payload: Payload = Payload()) {
		self.accessToken = accessToken
		self.header = header
		self.payload = payload
	}
	
	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case header, payload
	}
}

class Header: Codable {
	var alg: String = ""
	var cty: String = ""
	var kid: String = ""
	var typ: String = ""
	
	init(alg: String = "",
			 cty: String = "",
			 kid: String = "",
			 typ: String = "") {
		
		self.alg = alg
		self.cty = cty
		self.kid = kid
		self.typ = typ
	}
}

class Payload: Codable {
	
	var accountCreateTime: Double = 0
	var accountEnabled: Bool = false
	var accountExpired: Bool = false
	var accountLocked: Bool = false
	var accountPasswordReset: Double = 0
	var aud: String = ""
	var email: String = ""
	var emailVerified: Bool = false
	var exp: Double = 0
	var iat: Double = 0
	var iss: String = ""
	var jti: String = ""
	var photo: String = ""
	var sub: String = ""
	var userID: Int = 0
	
	init(accountCreateTime: Double = 0,
			 accountEnabled: Bool = false,
			 accountExpired: Bool = false,
			 accountLocked: Bool = false,
			 accountPasswordReset: Double = 0,
			 aud: String = "",
			 email: String = "",
			 emailVerified: Bool = false,
			 exp: Double = 0,
			 iat: Double = 0,
			 iss: String = "",
			 jti: String = "",
			 photo: String = "",
			 specialization: String = "",
			 sub: String = "",
			 userID: Int = 0) {
		
		self.accountCreateTime = accountCreateTime
		self.accountEnabled = accountEnabled
		self.accountExpired = accountExpired
		self.accountLocked = accountLocked
		self.accountPasswordReset = accountPasswordReset
		self.aud = aud
		self.email = email
		self.emailVerified = emailVerified
		self.exp = exp
		self.iat = iat
		self.iss = iss
		self.jti = jti
		self.photo = photo
		self.sub = sub
		self.userID = userID
	}
	
	enum CodingKeys: String, CodingKey {
		case accountCreateTime = "account_create_time"
		case accountEnabled = "account_enabled"
		case accountExpired = "account_expired"
		case accountLocked = "account_locked"
		case accountPasswordReset = "account_password_reset"
		case aud, email
		case emailVerified = "email_verified"
		case exp
		case iat, iss
		case jti
		case photo, sub
		case userID = "userId"
	}
}
