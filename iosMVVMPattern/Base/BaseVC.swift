//
//  VC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
import RxSwift
import RxKeyboard
import RxGesture

// Parent class for all view controllers
class BaseVC: UIViewController, LoginRoute {
	// MARK: Fields
	var disposeBag = DisposeBag()
	// Abstact class for working with alert dialogs
	var dialogHelper: DialogHelper!
	// Absract class for working with authorization
	let authHelper = AuthorizationHelper.shared
	// Abstact class for working with network
	var request = Request.shared
	// Action on Done button on Keyboard
	lazy var keyboardReturnAction: () -> Void = { }
	// View which showed on loading
	lazy var shadowView: UIView = {
		let shadowView = UIView(frame: UIScreen.main.bounds)
		
		shadowView.backgroundColor = .blur
		
		let loadingIndicator = UIActivityIndicatorView(style: .white)
		loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
		shadowView.addSubview(loadingIndicator)
		
		loadingIndicator.startAnimating()
		NSLayoutConstraint.activate([
			loadingIndicator.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
			loadingIndicator.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor)
			])
		
		shadowView.rx.tapGesture().when(.recognized).bind { _ in
			self.stopLoading()
		}.disposed(by: disposeBag)
		
		return shadowView
	} ()
	
	// MARK: Lifecycle
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		showLoginButton()
		dialogHelper = DialogHelper(self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

// MARK: NavigationBar
extension BaseVC {
	func showLoginButton() {
		
		if self as? Loginable != nil && !AuthorizationHelper.shared.isAuthorized() {
			navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.localizable.logIn(), style: .plain, target: self, action: #selector(tapLogin))
		} else {
			if navigationItem.rightBarButtonItem?.title == R.string.localizable.logIn() {
				navigationItem.rightBarButtonItem = nil
			}
		}
	}
	
	func setRightMenuButton(_ text: String, selector: Selector) {
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: text,
																												style: .plain,
																												target: self,
																												action: selector)
	}
	
	@objc func tapLogin() {
		openLogin()
	}
	
	func setTitle(_ str: String, isLarge: Bool = true) {
		extendedLayoutIncludesOpaqueBars = true
		title = str
		navigationController?.navigationBar.prefersLargeTitles = isLarge
	}
}

// MARK: Keyboard
extension BaseVC {
	func subscribeToKeyboard(_ scrollView: UIScrollView) {
		
		RxKeyboard.instance.visibleHeight
			.drive(onNext: { keyboardHeight in
				scrollView.contentInset.bottom = keyboardHeight
				scrollView.scrollIndicatorInsets.bottom = keyboardHeight
			}).disposed(by: disposeBag)
		
		view.rx.tapGesture()
			.when(.recognized)
			.bind { [unowned self] _ in
				self.view.endEditing(true)
			}.disposed(by: disposeBag)
	}
}

// MARK: Networking
extension BaseVC {
	func subscribeWith<ResponseType: Codable, ObservableType: Observable<BaseResponse<ResponseType>>>(response: ObservableType, action: @escaping (ResponseType) -> Void) {
		
		response.subscribe (onNext: { baseResponse in
			self.stopLoading()
			let showError = { self.dialogHelper.showBaseResponseError(baseResponse) }
			
			baseResponse.code == 200
			? baseResponse.response != nil ? action(baseResponse.response!) : showError()
			: showError()
			
		}, onError: { _ in
			self.stopLoading()
			self.dialogHelper.showRequestError()
		}).disposed(by: disposeBag)
	}
}

// MARK: Auto Return Text Fields
extension BaseVC: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		switch textField.returnKeyType {
		case .next:
			let nextTag = textField.tag + 1
			if let nextResponder = textField.superview?.viewWithTag(nextTag) {
				nextResponder.becomeFirstResponder()
			} else {
				textField.resignFirstResponder()
			}
		case .default:
			textField.resignFirstResponder()
		case .done:
			textField.resignFirstResponder()
			keyboardReturnAction()
		default:
			textField.resignFirstResponder()
		}
		return true
	}
}

// MARK: Loading Indicator
extension BaseVC {
	func showLoading() {
		UIApplication.shared.keyWindow?.addSubview(shadowView)
		self.shadowView.alpha = 0
		UIView.animate(withDuration: 0.5) {
			self.shadowView.alpha = 1
		}
	}
	
	func stopLoading() {
		UIView.animate(withDuration: 0.5, animations: {
			self.shadowView.alpha = 0
		}, completion: { _ in
			self.shadowView.removeFromSuperview()
		})
	}
}
