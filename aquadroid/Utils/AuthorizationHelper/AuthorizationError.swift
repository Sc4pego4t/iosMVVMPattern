//
//  AuthorizationError.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

class AuthorizationHelper {
	
	private var userDefault = UserDefaults.standard
	private static let instance = AuthorizationHelper()
	
	private init() {}
	private init(userDefault: UserDefaults) {}
	
	class func shared() -> AuthorizationHelper {
		// if we are in test, change userDefault from standart to test,
		// it's due to do not affect app data
		if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
			instance.userDefault = UserDefaults(suiteName: "test")!
		}
		
		return instance
	}
	
	/// Fuctions checks are user authorized
	/// and his token is up-to-date
	///
	/// - Returns: true if user authorized and token are not stale, or false otherwise
	func isAuthorized(doCareForExpiration: Bool = true) -> Bool {
		
		guard let token = getToken() else {
			return false
		}
		
		if doCareForExpiration {
			if Date().timeIntervalSince1970InMillis() > token.payload.exp {
				return false
			}
		}
		
		return true
	}
	
//	func isAdmin() -> Bool {
//
//		guard let token = getToken() else {
//			return false
//		}
//
//		return token.payload.authorities.contains(R.string.requests.admin())
//	}
	
	func getStringToken() -> String? {
		return userDefault.string(forKey: UserDefaults.Keys.tokenString)
	}
	
	func getUserID() -> Int? {
		guard let token = getToken() else { return nil}
		return token.payload.userID
	}
	
	func logOut() {
		userDefault.removeObject(forKey: UserDefaults.Keys.userToken)
		userDefault.removeObject(forKey: UserDefaults.Keys.tokenString)
	}
	
	fileprivate func getData() -> Data? {
		return userDefault.value(forKey: UserDefaults.Keys.userToken) as? Data
	}
	
	func getToken() -> AuthorizationResponse? {
		guard let data = getData() else { return nil }
		return try? JSONDecoder().decode(AuthorizationResponse.self, from: data)
	}
	
	func saveToken(_ response: AuthorizationResponse) {
		userDefault.set(try? JSONEncoder().encode(response), forKey: UserDefaults.Keys.userToken)
		userDefault.set(response.accessToken, forKey: UserDefaults.Keys.tokenString)
	}
}
