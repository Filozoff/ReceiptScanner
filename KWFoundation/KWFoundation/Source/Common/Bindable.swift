//
//  Bindable.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 14/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

@propertyWrapper public struct Bindable<T> {

	public var wrappedValue: T {
		didSet {
			projectedValue.value = wrappedValue
		}
	}

	public var projectedValue: Observer

	public init(wrappedValue: T) {
		self.wrappedValue = wrappedValue
		self.projectedValue = Observer(value: wrappedValue)
	}

	public struct Observer {

		var onCurrent: ValueClosure<T>?
		var value: T {
			didSet {
				onCurrent?(value)
			}
		}

		public mutating func onCurrent(completion: @escaping ValueClosure<T>) {
			onCurrent = completion
			onCurrent?(value)
		}
	}
}
