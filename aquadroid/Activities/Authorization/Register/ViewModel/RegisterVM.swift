//
//  RegisterVM.swift
//  aquadroid
//
//  Created by Andrey on 10/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import RxSwift

class RegisterVM: BaseVM {
	// MARK: Fields
	// Sends data for server request
	let credentials = PublishSubject<Credentials>()
	// Sends all errors in textFieds
	let errorPublisher = PublishSubject<[TextFieldError]>()
	
	// MARK: Functionality
	// check is all text fields are with right data
	// also publish all errors with help of errorPublisher
	// and update value of credentials
	func checkButtonValid(email: Observable<String>,
												password: Observable<String>,
												checkPassword: Observable<String>) -> Observable<Bool> {
		return Observable.combineLatest(email, password, checkPassword) { (email, password, checkPassword) in
			
			var errors = [TextFieldError]()
			
			if let error = ValidationHelper.shared.emailError(email) {
				errors.append(error)
			}
			
			if let error = ValidationHelper.shared.passwordError(password) {
				errors.append(error)
			}
			
			if let error = ValidationHelper.shared.checkPasswordError(password, str2: checkPassword) {
				errors.append(error)
			}
			
			self.errorPublisher.onNext(errors)
			
			if errors.isEmpty {
				self.credentials.onNext(Credentials(email: email, password: password))
				return true
			} else {
				return false
			}
		}
	}
	
}
