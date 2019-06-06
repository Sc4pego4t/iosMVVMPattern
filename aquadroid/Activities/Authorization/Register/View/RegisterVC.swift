//
//  RegisterVC.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import UIKit

// MARK: Route
// where this viewController can go
private typealias Routes = Closable

class RegisterVC: BaseVC, Routes {
	
	// MARK: Outlets
	
	// MARK: Fields
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setTitle(R.string.localizable.registration())
	}
	
	// MARK: Functionality
}

// MARK: Networking
extension RegisterVC {
	
}

