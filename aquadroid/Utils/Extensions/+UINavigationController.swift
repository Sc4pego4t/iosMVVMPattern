//
//  +UINavigationController.swift
//  aquadroid
//
//  Created by Андрей Глухих on 06/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

extension UINavigationController {
	
	func popToViewController(ofClass: AnyClass, animated: Bool = true) {
		if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
			popToViewController(vc, animated: animated)
		}
	}
	
	func popViewControllers(viewsToPop: Int, animated: Bool = true) {
		if viewControllers.count > viewsToPop {
			let vc = viewControllers[viewControllers.count - viewsToPop - 1]
			popToViewController(vc, animated: animated)
		}
	}
}
