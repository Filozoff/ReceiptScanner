//
//  ButtonStyle.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

extension ViewStyle where T: UIButton {

	static var common: ViewStyle<T> {
		return ViewStyle<T> {
			$0.titleLabel?.adjustsFontForContentSizeCategory = true
			$0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout)
			$0.contentEdgeInsets = UIEdgeInsets(
				top: Layout.Length.medium,
				left: Layout.Length.medium,
				bottom: Layout.Length.medium,
				right: Layout.Length.medium
			)
		}
	}

	static var filled: ViewStyle<T> {
		return common.compose(with: ViewStyle<T> {
			$0.setTitleColor(.white, for: .normal)
			$0.backgroundColor = .systemBlue
		})
	}

	static var rounded: ViewStyle<T> {
		return common.compose(with: ViewStyle<T> {
			$0.layer.cornerRadius = Layout.Length.small
		})
	}

	static var mainAction: ViewStyle<T> {
		return filled.compose(with: rounded)
	}
}
