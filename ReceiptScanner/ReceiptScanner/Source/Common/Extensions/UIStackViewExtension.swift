//
//  UIStackViewExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 12/02/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import UIKit

extension UIStackView {

	func addArrangedSubviews(_ views: [UIView]) {
		views.forEach { addArrangedSubview($0) }
	}
}
