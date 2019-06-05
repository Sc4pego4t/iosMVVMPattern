//
//  Request+URL.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

extension Request {
	
	enum DomainsURL {
		static let domain = "http://api.events4me.iac.spb.ru/"
		//    static let domain = "http://api.test.events4me.iac.spb.ru/"
		//    static let localDomain = "http://api.test.events4me.iac.spb.ru/"
		//    "http://192.168.43.15:8080/"
	}
	
	enum AutorizationURL {
		static let email = "email"
		static let password = "password"
		static let accessToken = "access_token"
		
		static let register = "authorization/registration"
		static let restore = "authorization/restore"
		static let login = "authorization/login"
		static let updatePassword = "authorization/update"
		static let refreshToken = "authorization/refresh"
		static let verifyEmail = "authorization/verification"
	}
}
