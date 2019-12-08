//
//  Observed.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 14/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

@propertyWrapper public struct Observed<T> {

	public var wrappedValue: T {
		didSet {
			projectedValue.set(value: wrappedValue)
		}
	}

	public var projectedValue: Observer<T>

	public init(wrappedValue: T) {
		self.wrappedValue = wrappedValue
		self.projectedValue = Observer(value: wrappedValue)
	}
}
