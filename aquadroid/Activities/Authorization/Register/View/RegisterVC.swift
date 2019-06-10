//
//  RegisterVC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
// MARK: Route
// where this viewController can go
private typealias Routes = Closable

class RegisterVC: BaseVC, Routes, Validatable {
	
	// MARK: Outlets
	@IBOutlet weak var emailTextField: ErrorTextField!
	@IBOutlet weak var passwordTextField: ErrorTextField!
	@IBOutlet weak var checkPasswordTextField: ErrorTextField!
	@IBOutlet weak var registerButton: ShadowButton!
	@IBOutlet weak var loginButton: ShadowButton!
	@IBOutlet weak var scrollView: UIScrollView!
	
	// MARK: Fields
	let viewModel = RegisterVM()
	var credentials = BehaviorRelay<Credentials>(value: Credentials())
	lazy var fieldsDictionary: [TextFieldType: ErrorTextField] = [
		.email: emailTextField,
		.password: passwordTextField,
		.checkPassword: checkPasswordTextField
	]
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.registration())
		subscribeToKeyboard(scrollView)
		setListeners()
		setBinding()
	}
	
	// MARK: Functionality
	func setListeners() {
		registerButton.rx.tapGesture().when(.recognized).bind { _ in
			let credentials = Credentials(email: self.emailTextField.text!,
																		password: self.passwordTextField.text!)
			self.registerRequest(credentials)
		}.disposed(by: disposeBag)
		
		loginButton.rx.tapGesture().when(.recognized).bind { _ in
			self.close()
		}.disposed(by: disposeBag)
	}
	
	func setBinding() {
		let email = emailTextField.rx.text.orEmpty.asObservable()
		let password = passwordTextField.rx.text.orEmpty.asObservable()
		let checkPassword = checkPasswordTextField.rx.text.orEmpty.asObservable()
		
		viewModel.credentials.bind(to: credentials).disposed(by: disposeBag)
		
		viewModel.checkButtonValid(email: email, password: password, checkPassword: checkPassword)
			.bind(to: registerButton.rx.isEnabled)
			.disposed(by: disposeBag)
		
		viewModel.errorPublisher.bind { errors in
			self.setupTextFields(errors)
			}.disposed(by: disposeBag)
	}
}

// MARK: Networking
extension RegisterVC {
	func registerRequest(_ credentials: Credentials) {
		subscribeWith(response: request.registerRequest(credentials: credentials)) { response in
			self.authHelper.saveToken(response)
			self.close(howMuchVCToClose: 2)
		}
	}
}
