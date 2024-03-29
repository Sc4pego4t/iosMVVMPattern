//
//  Closable.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

// view controller which implement this, can close itself just with method:
// close()
protocol Closable {
}

extension Closable where Self: UIViewController {
	func close(howMuchVCToClose count: Int = 1) {
		self.navigationController?.popViewControllers(viewsToPop: count)
	}
}
