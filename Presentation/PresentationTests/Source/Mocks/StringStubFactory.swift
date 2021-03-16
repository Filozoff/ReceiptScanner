//
//  StringStubFactory.swift
//  PresentationTests
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import Foundation

extension String {

	enum StubFactory {

		static func makeRandomAlphanumeric(length: Int) -> String {
			let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
			return String((0..<length).compactMap { _ in chars.randomElement() })
		}
	}
}
