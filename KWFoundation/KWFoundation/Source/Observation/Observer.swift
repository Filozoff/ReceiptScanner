//
//  Observer.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 30/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public class Observer<T> {

	public private(set) var current: T {
		didSet {
			subscribers.forEach { $0.operation(current) }
		}
	}

	private(set) var subscribers = Set<Subscriber<T>>()

	public init(value: T) {
		current = value
	}

	public func bind<O>(to object: O, for key: ReferenceWritableKeyPath<O, T>) -> CancellationToken where O: AnyObject {
		let completion: ValueClosure<T> = { [weak object, weak key] (value) in
			guard let key = key else { return }
			object?[keyPath: key] = value
		}

		return onCurrent(completion: completion)
	}

	public func onCurrent(completion: @escaping ValueClosure<T>) -> CancellationToken {
		let subscriber = Subscriber(operation: completion)
		subscriber.operation(current)
		subscribers.insert(subscriber)

		return CancellationToken { [weak self] in
			self?.subscribers.remove(subscriber)
		}
	}

	public func set(value: T) {
		current = value
	}
}
