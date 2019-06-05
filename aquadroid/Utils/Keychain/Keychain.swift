//
//  Keychain.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
class Keychain {
	
	static let server = Request.DomainsURL.domain
	
	static func saveCredentials(credentials: Credentials) throws {
		let email = credentials.email
		let password = credentials.password.data(using: String.Encoding.utf8)!
		let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
																kSecAttrAccount as String: email,
																kSecAttrServer as String: server,
																kSecValueData as String: password]
		
		try? deleteCredentials()
		
		let status = SecItemAdd(query as CFDictionary, nil)
		guard status == errSecSuccess else { throw KeychainError.unexpectedPasswordData }
	}
	
	static func deleteCredentials() throws {
		let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
																kSecAttrServer as String: server]
		
		let status = SecItemDelete(query as CFDictionary)
		guard status != errSecItemNotFound else { throw KeychainError.noPassword }
		guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
	}
	
	static func getCredentials() throws -> Credentials {
		let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
																kSecAttrServer as String: server,
																kSecMatchLimit as String: kSecMatchLimitOne,
																kSecReturnAttributes as String: true,
																kSecReturnData as String: true]
		var item: CFTypeRef?
		let status = SecItemCopyMatching(query as CFDictionary, &item)
		guard status != errSecItemNotFound else { throw KeychainError.noPassword }
		guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
		
		guard let existingItem = item as? [String: Any],
			let passwordData = existingItem[kSecValueData as String] as? Data,
			let password = String(data: passwordData, encoding: String.Encoding.utf8),
			let email = existingItem[kSecAttrAccount as String] as? String
			else {
				throw KeychainError.unexpectedPasswordData
		}
		
		return Credentials(email: email, password: password)
	}
	
}
