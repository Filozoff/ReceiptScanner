//
//  Stylable.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

protocol Stylable { }

extension Stylable {
	
	func apply(style: ViewStyle<Self>) {
		style.style(self)
	}
}
