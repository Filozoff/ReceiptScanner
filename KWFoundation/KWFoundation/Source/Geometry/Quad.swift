//
//  Quad.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public struct Quad {
	
	public var bottomLeft: Point
	public var bottomRight: Point
	public var topLeft: Point
	public var topRight: Point

	public init(topLeft: Point, topRight: Point, bottomRight: Point, bottomLeft: Point) {
		self.topLeft = topLeft
		self.topRight = topRight
		self.bottomRight = bottomRight
		self.bottomLeft = bottomLeft
	}
}

extension Quad {
	
	public static let zero = Quad(topLeft: .zero, topRight: .zero, bottomRight: .zero, bottomLeft: .zero)
}
