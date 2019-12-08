//
//  Subscriber.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 02/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

struct Subscriber<T> {

	let id = UUID()
	let operation: ValueClosure<T>

	init(operation: @escaping ValueClosure<T>) {
		self.operation = operation
	}
}

extension Subscriber: Hashable {

	public static func == (lhs: Subscriber, rhs: Subscriber) -> Bool {
		return lhs.id == rhs.id
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
