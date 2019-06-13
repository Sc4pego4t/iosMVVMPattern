//
//  +Date.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
extension Date {
	
	init(timestampInMillis: Double) {
		self.init(timeIntervalSince1970: timestampInMillis / 1000)
	}
	
	func timeIntervalSince1970InMillis() -> Double {
		return self.timeIntervalSince1970 * 1000
	}
}
