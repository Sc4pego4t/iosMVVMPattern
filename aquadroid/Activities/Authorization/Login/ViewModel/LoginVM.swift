//
//  LoginViewModel.swift
//  aquadroid
//
//  Created by Андрей Глухих on 07/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import RxSwift
import RxCocoa

enum ErrorType {
	case email, password
}

class LoginVM: BaseVM {
	let credentials = PublishSubject<Credentials>()
	let errorPublisher = PublishSubject<[(String, ErrorType)]>()
	
	func checkButtonValid(email: Observable<String>,
												password: Observable<String>) -> Observable<Bool> {
		return Observable.combineLatest(email, password) { (email, password) in
			
			var errors = [(String, ErrorType)]()
			if let error = ValidationHelper.shared.emailError(email) {
				errors.append((error, .email))
			}
			
			if let error = ValidationHelper.shared.passwordError(password) {
				errors.append((error, .password))
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
