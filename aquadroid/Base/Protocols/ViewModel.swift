//
//  ViewModel.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

protocol ViewModel {
}

protocol ViewModelBased {
	associatedtype ViewModelType: ViewModel
	var viewModel: ViewModelType { get set }
}
