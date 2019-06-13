//
//  RequestError.swift
//  aquadroid
//
//  Created by Андрей Глухих on 05/06/2019.
//  Copyright © 2019 Андрей Глухих. All rights reserved.
//

import Foundation

enum RequestError: Error {
	case decodingError, encodingError
	
	var localizedDescription: String {
		switch self {
		case .decodingError:
			return R.string.localizable.decodingError()
		case .encodingError:
			return R.string.localizable.encodingError()
		}
	}
}
