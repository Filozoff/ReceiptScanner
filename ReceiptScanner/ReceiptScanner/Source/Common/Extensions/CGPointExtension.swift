//
//  CGPointExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 25/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import CoreGraphics
import KWFoundation

extension CGPoint {

	init(point: Point) {
		self.init(x: point.x, y: point.y)
	}
}

extension CGPoint {

	static func * (lhs: Self, rhs: Self) -> Self {
		return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
	}
}
