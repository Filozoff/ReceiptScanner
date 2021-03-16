//
//  TextFieldViewModelTests.swift
//  PresentationTests
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import Presentation

class TextFieldViewModelTests: XCTestCase {

	private var sut: TextFieldViewModel!

    func test_givenKeyInputPolicy_whenShouldChangeStringCalled_thenPolicyPredicateCalled() throws {

		// given
		var numberOfPredicateCalls = 0
		let range = NSRange(location: 0, length: 3)
		let replacementString = "3223"
		let string = "Test_1231123"
		let policy = KeyInputPolicy.StubFactory.make { _ in
			numberOfPredicateCalls += 1
		}

		sut = TextFieldViewModel(inputPolicy: policy)

		// when
		_ = sut.shouldChange(replacementString, in: string, at: range)

		// then
		XCTAssertEqual(numberOfPredicateCalls, 1)
	}

	func test_givenRange_whenShouldChangeStringCalled_thenStringComputedCorrectly() throws {

		// given
		let testData: [(given: NSRange, expected: String) ] = [
			(NSRange(location: 0, length: 0), "test1234567890"),
			(NSRange(location: 0, length: 2), "test34567890"),
			(NSRange(location: 0, length: 10), "test"),
			(NSRange(location: 2, length: 8), "12test")
		]
		let replacementString = "test"
		let string = "1234567890"
		var resultString: String?
		let policy = KeyInputPolicy.StubFactory.make {
			resultString = $0
		}

		sut = TextFieldViewModel(inputPolicy: policy)

		testData.forEach {

			// when
			_ = sut.shouldChange(replacementString, in: string, at: $0.given)

			// then
			XCTAssertEqual(resultString, $0.expected)
		}
	}

	func test_givenInvalidRange_whenShouldChangeStringCalled_thenReturnsFalse() throws {

		// given
		var numberOfPredicateCalls = 0
		let range = NSRange(location: 0, length: 11)
		let replacementString = "test"
		let string = "1234567890"
		let policy = KeyInputPolicy.StubFactory.make { _ in
			numberOfPredicateCalls += 1
		}

		sut = TextFieldViewModel(inputPolicy: policy)

		// when
		let result = sut.shouldChange(replacementString, in: string, at: range)

		// then
		XCTAssertFalse(result)
		XCTAssertEqual(numberOfPredicateCalls, 0)
	}
}
