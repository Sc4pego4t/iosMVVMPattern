//
//  ValidationHelper.swift
//  aquadroid
//
//  Created by Андрей Глухих on 07/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

enum TextFieldType {
	case email, password, checkPassword
}

typealias TextFieldError = (message: String, type: TextFieldType)

class ValidationHelper {
	
	static var shared = ValidationHelper()
	
	private init() { }
	
	func emailError(_ str: String) -> TextFieldError? {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: str) ? nil : (R.string.localizable.emailError(), .email)
	}
	
	func passwordError(_ str: String) -> TextFieldError? {
		return str.count > 5 ? nil : (R.string.localizable.passwordError(), .password)
	}
	
	func checkPasswordError(_ str1: String, str2: String) -> TextFieldError? {
		return str1 == str2 ? nil : (R.string.localizable.checkPasswordError(), .checkPassword)
	}
}
