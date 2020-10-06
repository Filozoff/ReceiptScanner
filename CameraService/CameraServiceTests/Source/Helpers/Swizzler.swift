//
//  Swizzler.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 30/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import ObjectiveC

struct Swizzler {

    private let objectClass: AnyClass

    init(objectClass: AnyClass) {
        self.objectClass = objectClass
    }

	func replace(_ oldSelector: Selector, with newSelector: Selector) {
		guard
			let old = class_getInstanceMethod(objectClass, oldSelector),
			let new = class_getInstanceMethod(objectClass, newSelector)
		else { return }

		method_setImplementation(old, method_getImplementation(new))
    }
}
