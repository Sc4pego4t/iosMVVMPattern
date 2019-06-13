//
//  DialogHelper.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

class DialogHelper {
	
	weak var controller: UIViewController!
	
	init(_ controller: UIViewController!) {
		self.controller = controller
	}
	
	func showDialog(withTitle title: String, andMessage message: String, withCompletion completion: @escaping () -> Void = {}) {
		
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil))

		controller.present(alertController, animated: true, completion: completion)
	}
	
	func showDialog(withTitle title: String, andMessages messages: [String]) {
		var message = ""
		messages.forEach { message.append($0 + "\n") }
		showDialog(withTitle: title, andMessage: message)
	}
	
	func showBaseResponseError<ResponseType>(_ response: BaseResponse<ResponseType>) {
		
		var title = R.string.localizable.error()
		var message = R.string.localizable.serverError()
		
		if let message = response.message {
			title = message
		}
		
		if let temp = response.errors, temp.count > 0 {
			message = temp[0]
		}
		
		showDialog(withTitle: title, andMessage: message)
	}
	
	func showBaseResponse<ResponseType>(response: BaseResponse<ResponseType>) {
		
		var title = ""
		var message = ""
		
		if let message = response.message {
			title = message
		}
		
		if let temp = response.errors, temp.count > 0 {
			message = temp[0]
		}
		
		showDialog(withTitle: title, andMessage: message)
		
	}
	
	func showRouteErrorDialog() {
		showDialog(withTitle: R.string.localizable.error(), andMessage: R.string.localizable.routeError())
	}
	
	func showRequestError() {
		showDialog(withTitle: R.string.localizable.error(), andMessage: R.string.localizable.serverError())
	}
	
	func showError() {
		
	}
}
