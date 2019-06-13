//
//  BorderedButton.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit
class BorderedButton: UIButton {

	override func layoutSubviews() {
		super.layoutSubviews()
		self.layer.borderWidth = 1
		self.layer.borderColor = self.titleLabel?.textColor.cgColor
		
	}
}
