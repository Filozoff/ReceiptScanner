//
//  ViewStyle.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation

struct ViewStyle<T> {
	
	let style: ValueClosure<T>
	
	func compose(with style: ViewStyle<T>) -> ViewStyle<T> {
		return ViewStyle<T> {
			self.style($0)
			style.style($0)
		}
	}
}
