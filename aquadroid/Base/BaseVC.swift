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

class BaseVC: UIViewController, LoginRoute {
	
	var disposeBag = DisposeBag()
	var dialogHelper: DialogHelper!
	var request = Request.shared
	
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
		
		if self as? Loginable != nil && !AuthorizationHelper.shared().isAuthorized() {
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
	func registerForKeyboardNotifications(scrollView: UIScrollView) {
		
		RxKeyboard.instance.visibleHeight
			.drive(onNext: { [scrollView] keyboardVisibleHeight in
				print("OFSSETS IS", keyboardVisibleHeight)
				scrollView.contentInset.bottom = keyboardVisibleHeight
			}).disposed(by: disposeBag)
		
		RxKeyboard.instance.willShowVisibleHeight
			.drive(onNext: { keyboardVisibleHeight in
				scrollView.contentOffset.y += keyboardVisibleHeight
			})
			.disposed(by: self.disposeBag)
		
		view.rx.tapGesture()
			.when(.recognized)
			.bind { _ in
				self.view.endEditing(true)
			}.disposed(by: disposeBag)
	}
	
	@objc func hideKeyboardOnTap() {
		view.endEditing(true)
	}
	
	func removeKeyboardNotifications() {
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
//	@objc func kbWillShow(_ notification: Notification) {
//		let userInfo = notification.userInfo
//		guard let kbFrameSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
//			fatalError(R.string.programmerErrors.wrongValue())
//		}
//
//		let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.cgRectValue.height, right: 0)
//		scrollView?.contentInset = insets
//		scrollView?.scrollIndicatorInsets = insets
//	}
//
//	@objc func kbWillHide(_ notification: Notification) {
//		let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//		scrollView?.contentInset = insets
//		scrollView?.scrollIndicatorInsets = insets
//	}
}

// MARK: Networking
extension BaseVC {
	func subscribeWith<ResponseType: Codable, ObservableType: Observable<BaseResponse<ResponseType>>>(response: ObservableType, action: @escaping (ResponseType) -> Void) {
		
		response.subscribe (onNext: { baseResponse in
			
			if baseResponse.code == 200, let response = baseResponse.response {
				action(response)
			} else {
				self.dialogHelper.showBaseResponseError(baseResponse)
			}
			
		}, onError: { _ in
			self.dialogHelper.showRequestError()
		}).disposed(by: disposeBag)
	}
}
