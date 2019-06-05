//
//  KeychainError.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
enum KeychainError: Error {
	case noPassword
	case unexpectedPasswordData
	case unhandledError(status: OSStatus)
}
