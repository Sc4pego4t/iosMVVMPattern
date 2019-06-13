//
//  +String.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation
extension String {
	init(_ objects: Any ...) {
		self.init()
		
		var str = ""
		for object in objects {
			str += "\(object)"
		}
		
		self = str
	}
}
