//
//  LoginVC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
import RxCocoa

// MARK: Route
// where this viewController can go
private typealias Routes = RestoreRoute & RegisterRoute & Closable

class LoginVC: BaseVC, Routes {

	// MARK: Outlets
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var emailTextField: ErrorTextField!
	@IBOutlet weak var passwordTextField: ErrorTextField!
	@IBOutlet weak var loginButton: ShadowButton!
	@IBOutlet weak var registerButton: ShadowButton!
	@IBOutlet weak var formStackView: UIStackView!
	
	// MARK: Fields
	let viewModel = LoginVM()
	var credentials = BehaviorRelay<Credentials>(value: Credentials())
	lazy var fieldsDictionary: [ErrorType: ErrorTextField] = [
		.email: emailTextField,
		.password: passwordTextField
	]
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.logIn())
		subscribeToKeyboard(scrollView)
		setListeners()
		setBindings()
		keyboardReturnAction = { self.loginRequest() }
	}

	// MARK: Functionality
	func setListeners() {
		loginButton.rx.tapGesture().when(.recognized).bind { _ in
			self.loginRequest()
		}.disposed(by: disposeBag)
		
		registerButton.rx.tapGesture().when(.recognized).bind { _ in
			self.openRegister()
		}.disposed(by: disposeBag)
	}
	
	func setBindings() {
		let email = emailTextField.rx.text.orEmpty.asObservable()
		let password = passwordTextField.rx.text.orEmpty.asObservable()

		viewModel.credentials.bind(to: credentials).disposed(by: disposeBag)
		
		viewModel.checkButtonValid(email: email, password: password)
			.bind(to: loginButton.rx.isEnabled)
			.disposed(by: disposeBag)
		
		viewModel.errorPublisher.bind { errors in
			self.setupTextFields(errors)
		}.disposed(by: disposeBag)
	}
	
	// Show errors or hide them in the textFields
	func setupTextFields(_ errors: [TextFieldError]) {
		fieldsDictionary.keys.forEach { key in
			if !errors.contains { $0.error == key } {
				fieldsDictionary[key]?.hideError()
			}
		}
		
		errors.forEach { error in
			fieldsDictionary[error.error]?.showError(error.message, parentView: view)
		}
	}
}

// MARK: Networking
extension LoginVC {
	func loginRequest() {
		showLoading()
		subscribeWith(response: request.loginRequest(credentials: credentials.value)) { response in
			self.authHelper.saveToken(response)
			self.close()
		}
	}
}
