//
//  ShadowedButton.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {
	func setShadow(shadowColor: CGColor = UIColor.black.cgColor,
								 shadowOpacity: Float = 0.2,
								 shadowRadius: CGFloat) {
		self.layer.shadowColor = shadowColor
		self.layer.shadowOffset = CGSize(width: 0, height: shadowRadius / 2)
		self.layer.shadowRadius = shadowRadius
		self.layer.shadowOpacity = shadowOpacity
	}
	
	/*
	once the bounds of the drop shadow view (container view) is initialized,
	the bounds variable value will be set/updated and the
	setupShadow method will run
	*/
	override var bounds: CGRect {
		didSet {
			setupShadowPath()
		}
	}
	
	private func setupShadowPath() {
		self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
		
		// further optimization by rasterizing the container view and its shadow into bitmap instead of dynamically rendering it every time
		// take note that the rasterized bitmap will be saved into memory and it might take quite some memory if you have many cells
		
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = UIScreen.main.scale
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		setShadow(shadowRadius: 2)
	}
}
