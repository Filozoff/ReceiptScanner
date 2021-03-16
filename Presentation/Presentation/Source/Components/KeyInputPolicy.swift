//
//  KeyInputPolicy.swift
//  Presentation
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import KWFoundation

public struct KeyInputPolicy {

	let predicate: ValueReturnClosure<String, Bool>

	static let none = KeyInputPolicy { _ in true }

	static func maxCharacters(count: UInt) -> KeyInputPolicy {
		KeyInputPolicy { $0.count <= count }
	}
}
