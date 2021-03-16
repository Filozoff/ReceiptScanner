//
//  KeyInputPolicy.swift
//  PresentationTests
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import KWFoundation
@testable import Presentation

extension KeyInputPolicy {

	enum StubFactory {

		static func make(spyClosure: @escaping ValueClosure<String>) -> KeyInputPolicy {
			KeyInputPolicy {
				spyClosure($0)
				return true
			}
		}
	}
}
