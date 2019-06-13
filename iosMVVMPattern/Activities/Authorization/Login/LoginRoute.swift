//
//  LoginRoute.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

protocol LoginRoute {
}

extension LoginRoute where Self: UIViewController {
	func openLogin() {
		guard let vc = R.storyboard.loginVC().instantiateInitialViewController() else {
			DialogHelper(self).showRouteErrorDialog()
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
