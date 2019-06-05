//
//  +UserDefaults.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
extension UserDefaults {
	enum Keys {
		static let userToken = "token"
		static let tokenString = "tokenString"
		static let refreshProfileImage = "refreshProfileImage"
		static let isLoginedBefore = "isLoginedBeforeKey"
	}
}
