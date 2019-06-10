//
//  Validatable.swift
//  aquadroid
//
//  Created by Andrey on 10/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import UIKit

// Protocol for showing errors in the text fields
// Derived class must setup fieldsDictionary with all validatable textFields
// With type [TextFieldType: ErrorTextField]
protocol Validatable where Self: UIViewController {
	// Dunno how to constraint this with [TextFieldType: ErrorTextField]
	associatedtype DictionaryType /* [TextFieldType: ErrorTextField] */
	var fieldsDictionary: DictionaryType { get set }
}

extension Validatable {
	func setupTextFields(_ errors: [TextFieldError]) {
		
		guard let fieldsDictionary =  fieldsDictionary as? [TextFieldType: ErrorTextField] else {
			return
		}
		
		fieldsDictionary.keys.forEach { key in
			if !errors.contains { $0.type == key } {
				print(fieldsDictionary)
				print(key)
				fieldsDictionary[key]?.hideError()
			}
		}

		errors.forEach { error in
			fieldsDictionary[error.type]?.showError(error.message, parentView: view)
		}
	}
}
