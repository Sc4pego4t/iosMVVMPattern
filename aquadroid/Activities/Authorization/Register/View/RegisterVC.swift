//
//  RegisterVC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

// MARK: Route
// where this viewController can go
private typealias Routes = Closable

class RegisterVC: BaseVC, Routes {
	
	// MARK: Outlets
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var checkPasswordTextField: UITextField!
	@IBOutlet weak var registerButton: ShadowButton!
	@IBOutlet weak var loginButton: ShadowButton!
	@IBOutlet weak var scrollView: UIScrollView!
	
	// MARK: Fields
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.registration())
		subscribeToKeyboard(scrollView)
		setListeners()
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
}

// MARK: Networking
extension RegisterVC {
	func registerRequest(_ credentials: Credentials) {
		print("REGISTER REQUEST IS")
		subscribeWith(response: request.registerRequest(credentials: credentials)) { response in
			print(response)
		}
	}
}
