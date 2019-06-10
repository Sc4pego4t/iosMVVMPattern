//
//  ErrorTextField.swift
//  aquadroid
//
//  Created by Андрей Глухих on 07/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
import RxSwift

class ErrorTextField: UITextField {
	
	// MARK: Fields
	var errorButton: UIButton = {
		let errorButton = UIButton(type: .system)
		errorButton.setImage(R.image.error(), for: .normal)
		errorButton.tintColor = .red
		errorButton.translatesAutoresizingMaskIntoConstraints = false
		return errorButton
	}()
	
	// MARK: Error Button Appereance
	let size: CGFloat = 20
	let offset: CGFloat = 10
	
	var tipView = TipView()
	var disposeBag = DisposeBag()
	
	// MARL: Functionality
	func showError(_ message: String, parentView: UIView) {
		disposeBag = DisposeBag()
		parentView.addSubview(errorButton)
		
		NSLayoutConstraint.activate([
			errorButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			errorButton.leftAnchor.constraint(equalTo: self.rightAnchor, constant: offset),
			errorButton.heightAnchor.constraint(equalToConstant: size),
			errorButton.widthAnchor.constraint(equalToConstant: size)
		])
		
		errorButton.rx.tap.bind { [unowned self] _ in
			
			if self.tipView.superview != nil {
				self.hideErrorTip()
				return
			}
			
			self.showErrorTip(view: parentView, message: message)
			
		}.disposed(by: disposeBag)
		
		parentView.rx.tapGesture()
			.when(.recognized)
			.bind { _ in
			self.hideErrorTip()
		}.disposed(by: disposeBag)
	}
	
	func hideError() {
		hideErrorTip()
		errorButton.removeFromSuperview()
	}
	
	private func showErrorTip(view: UIView, message: String) {
		view.addSubview(self.tipView)
		self.tipView.alpha = 0
		UIView.animate(withDuration: 0.2) {
			self.tipView.alpha = 1
		}
		self.tipView.setupTipView(viewToArrow: self.errorButton, leftAnchor: self.leftAnchor, message: message)
	}

	private func hideErrorTip() {
		self.tipView.alpha = 1
		UIView.animate(withDuration: 0.2, animations: {
			self.tipView.alpha = 0
		}, completion: { _ in
			self.tipView.removeFromSuperview()
		})
	}
}
