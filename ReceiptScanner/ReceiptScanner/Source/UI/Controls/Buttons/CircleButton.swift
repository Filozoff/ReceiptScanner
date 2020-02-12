//
//  CircleButton.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 24/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

	override var intrinsicContentSize: CGSize {
		var size = super.intrinsicContentSize
		size.width = max(size.width, size.height, Layout.Length.extraExtraLarge)
		size.height = max(size.width, size.height, Layout.Length.extraExtraLarge)
		return size
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		layer.cornerRadius = bounds.width / 2.0
	}
}
