//
//  RestoreRoute.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

protocol RestoreRoute {
}

extension RestoreRoute where Self: UIViewController {
	func openRestore() {
		guard let vc = R.storyboard.restoreVC().instantiateInitialViewController() else {
			DialogHelper(self).showRouteErrorDialog()
			return
		}
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
