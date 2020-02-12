//
//  Symbols.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 24/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

enum Symbol: String {

	case plus = "plus"
	case plusCircle = "plus.circle"
	case plusCircleFill = "plus.circle.fill"
}

extension UIImage {

	convenience init?(symbol: Symbol, with configuration: UIImage.SymbolConfiguration? = nil) {
		self.init(systemName: symbol.rawValue, withConfiguration: configuration)
	}
}
