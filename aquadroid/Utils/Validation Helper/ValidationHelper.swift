//
//  ValidationHelper.swift
//  aquadroid
//
//  Created by Андрей Глухих on 07/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

class ValidationHelper {
	
	static var shared = ValidationHelper()
	
	private init() { }
	
	func emailError(_ str: String) -> String? {
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: str) ? nil : R.string.localizable.emailError()
	}
	
	func passwordError(_ str: String) -> String? {
		return str.count > 5 ? nil : R.string.localizable.passwordError()
	}
	
	func checkPasswordError(_ str1: String, str2: String) -> String? {
		return str1 == str2 ? nil : R.string.localizable.checkPasswordError()
	}
}
