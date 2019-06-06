//
//  RegisterRoute.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

protocol RegisterRoute {
}

extension RegisterRoute where Self: UIViewController {
	func openRegister() {
		guard let vc = R.storyboard.registerVC().instantiateInitialViewController() else {
			DialogHelper(self).showRouteErrorDialog()
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
