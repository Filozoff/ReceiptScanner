//
//  Point.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public struct Point: Equatable {

	public var x: Double
	public var y: Double

	public init(x: Double = 0.0, y: Double = 0.0) {
		self.x = x
		self.y = y
	}
}

extension Point {

	public static let zero = Point()
}
