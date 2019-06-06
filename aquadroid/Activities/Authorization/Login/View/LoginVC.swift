//
//  LoginVC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

// MARK: Route
// where this viewController can go
private typealias Routes = RestoreRoute & RegisterRoute & Closable

class LoginVC: BaseVC, Routes {

	// MARK: Outlets
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: ShadowButton!
	@IBOutlet weak var registerButton: ShadowButton!
	
	// MARK: Fields
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.logIn())
		subscribeToKeyboard(scrollView)
		setListeners()
	}
	
	// MARK: Functionality
	func setListeners() {
		loginButton.rx.tapGesture().when(.recognized).bind { _ in
			let credentials = Credentials(email: self.emailTextField.text!,
																		password: self.passwordTextField.text!)
			self.loginRequest(credentials: credentials)
		}.disposed(by: disposeBag)
		
		registerButton.rx.tapGesture().when(.recognized).bind { _ in
			self.openRegister()
		}.disposed(by: disposeBag)
		
	}
}

// MARK: Networking
extension LoginVC {
	func loginRequest(credentials: Credentials) {
		subscribeWith(response: request.loginRequest(credentials: credentials)) { response in
			print(response)
		}
		
	}
}
