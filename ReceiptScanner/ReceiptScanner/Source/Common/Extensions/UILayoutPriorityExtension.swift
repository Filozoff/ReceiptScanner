//
//  UILayoutPriorityExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 09/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

extension UILayoutPriority {

	static let lessDefaultLow = UILayoutPriority.defaultLow - 1
	static let overDefaultLow = UILayoutPriority.defaultLow + 1
	static let lessDefaultHigh = UILayoutPriority.defaultHigh - 1
	static let overDefaultHigh = UILayoutPriority.defaultHigh + 1

	/// 999.0
	static let important = UILayoutPriority.required - 1

	/// 1.0
	static let minimal: UILayoutPriority = 1.0
}

extension UILayoutPriority: ExpressibleByFloatLiteral {

	public init(floatLiteral value: Float) {
		self.init(rawValue: value)
	}
}
