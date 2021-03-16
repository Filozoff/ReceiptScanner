//
//  KeyInputPolicyTests.swift
//  PresentationTests
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import Presentation

class KeyInputPolicyTests: XCTestCase {

	private var sut: KeyInputPolicy!

    func test_givenNone_whenCalled_thenReturnsTrue() throws {

		// given
		let testData: [String] = [
			String.StubFactory.makeRandomAlphanumeric(length: 0),
			String.StubFactory.makeRandomAlphanumeric(length: 1),
			String.StubFactory.makeRandomAlphanumeric(length: 10),
			String.StubFactory.makeRandomAlphanumeric(length: 100),
			String.StubFactory.makeRandomAlphanumeric(length: 1000),
			String.StubFactory.makeRandomAlphanumeric(length: 10000)
		]
		sut = KeyInputPolicy.none

		// when
		// then
		testData.forEach {
			XCTAssertTrue(sut.predicate($0))
		}
    }

	func test_givenInvalidMaxChars_whenCalled_thenReturnsFalse() throws {

		// given
		let givenMaxChars: UInt = 30
		let testData: [String] = [
			String.StubFactory.makeRandomAlphanumeric(length: 31),
			String.StubFactory.makeRandomAlphanumeric(length: 32),
			String.StubFactory.makeRandomAlphanumeric(length: 100),
			String.StubFactory.makeRandomAlphanumeric(length: 1000)
		]
		sut = KeyInputPolicy.maxCharacters(count: givenMaxChars)

		// when
		// then
		testData.forEach {
			XCTAssertFalse(sut.predicate($0))
		}
	}

	func test_givenValidMaxChars_whenCalled_thenReturnsFalse() throws {

		// given
		let givenMaxChars: UInt = 30
		let testData: [String] = [
			String.StubFactory.makeRandomAlphanumeric(length: 0),
			String.StubFactory.makeRandomAlphanumeric(length: 1),
			String.StubFactory.makeRandomAlphanumeric(length: 10),
			String.StubFactory.makeRandomAlphanumeric(length: 30)
		]
		sut = KeyInputPolicy.maxCharacters(count: givenMaxChars)

		// when
		// then
		testData.forEach {
			XCTAssertTrue(sut.predicate($0))
		}
	}
}
