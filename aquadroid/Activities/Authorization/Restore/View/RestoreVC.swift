//
//  RestoreVC.swift
//  aquadroid
//
//  Created by Andrey on 10/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
import RxCocoa
import RxKeyboard
// MARK: Route
// where this viewController can go
private typealias Routes = RestoreRoute & RegisterRoute & Closable

class RestoreVC: BaseVC, Routes, Validatable {
	
	// MARK: Outlets
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var emailTextField: ErrorTextField!
	@IBOutlet weak var loginButton: ShadowButton!
	@IBOutlet weak var restoreButton: UIButton!

	// MARK: Fields
	let viewModel = RestoreVM()
	var email = BehaviorRelay<String>(value: "")
	lazy var fieldsDictionary: [TextFieldType: ErrorTextField] = [
		.email: emailTextField
	]
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.logIn())
		subscribeToKeyboard(scrollView)
		setListeners()
		setBindings()
	}
	
	// MARK: Functionality
	func setListeners() {
		loginButton.rx.tapGesture().when(.recognized).bind { _ in
			self.close()
		}.disposed(by: disposeBag)
		
		restoreButton.rx.tapGesture().when(.recognized).bind { _ in
			self.restoreRequest()
		}.disposed(by: disposeBag)
	}
	
	func setBindings() {
		let email = emailTextField.rx.text.orEmpty.asObservable()
		
		viewModel.email.bind(to: self.email).disposed(by: disposeBag)
		
		viewModel.checkButtonValid(email: email)
			.bind(to: restoreButton.rx.isEnabled)
			.disposed(by: disposeBag)
		
		viewModel.errorPublisher.bind { errors in
			self.setupTextFields(errors)
			}.disposed(by: disposeBag)
	}
}

// MARK: Networking
extension RestoreVC {
	func restoreRequest() {
		showLoading()
		subscribeWith(response: request.restoreRequest(email: email.value)) { response in
//			self.close()
		}
	}
}
