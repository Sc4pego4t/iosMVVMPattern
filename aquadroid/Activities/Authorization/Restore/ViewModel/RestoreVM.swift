//
//  RestoreVM.swift
//  aquadroid
//
//  Created by Andrey on 10/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import RxSwift

class RestoreVM: BaseVM {
	// MARK: Fields
	// Sends data for server request
	let email = PublishSubject<String>()
	// Sends all errors in textFieds
	let errorPublisher = PublishSubject<[TextFieldError]>()
	
	// MARK: Functionality
	// check is all text fields are with right data
	// also publish all errors with help of errorPublisher
	// and update value of credentials
	fileprivate func validate(_ email: String) -> Observable<Bool> {
		var errors = [TextFieldError]()
		
		if let error = ValidationHelper.shared.emailError(email) {
			errors.append(error)
		}
		
		self.errorPublisher.onNext(errors)
		
		if errors.isEmpty {
			self.email.onNext(email)
			return Observable.just(true)
		} else {
			return Observable.just(false)
		}
	}
	
	func checkButtonValid(email: Observable<String>) -> Observable<Bool> {

		return email.flatMap { email in
			return self.validate(email)
		}
	}
	
}
