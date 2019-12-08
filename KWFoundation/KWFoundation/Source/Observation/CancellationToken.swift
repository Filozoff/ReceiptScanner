//
//  CancellationToken.swift
//  KWFoundation
//
//  Created by Kamil Wyszomierski on 30/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public class CancellationToken {

	let id = UUID()
	
	private let onCancel: EmptyClosure

	public init(_ cancel: @escaping EmptyClosure) {
		self.onCancel = cancel
	}

	deinit {
		cancel()
	}

	public func cancel() {
		onCancel()
	}

	public func store<T>(in collection: inout T) where T: RangeReplaceableCollection, T.Element == CancellationToken {
		collection.append(self)
	}

	public func store(in set: inout Set<CancellationToken>) {
		set.insert(self)
	}
}

extension CancellationToken: Hashable {

	public static func == (lhs: CancellationToken, rhs: CancellationToken) -> Bool {
		return lhs.id == rhs.id
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
