//
//  ObservedTests.swift
//  KWFoundationTests
//
//  Created by Kamil Wyszomierski on 17/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import KWFoundation

class ObservedTests: XCTestCase {

	@Observed private var sut = "test_observed"
	private var token: CancellationToken!

	func test_givenOnCurrentClosure_whenOnCurrentCalled_thenExpectOnCurrentCompletionCallWithCurrentValue() {

		// given
		var passedValue: String?
		let onCurrentClosure: ValueClosure<String> = { passedValue = $0 }

		// when
		token = $sut.onCurrent(completion: onCurrentClosure)

		// then
		XCTAssertEqual(sut, passedValue)
	}

    func test_givenOnCurrentClosureWithNewValue_whenOnCurrentCalled_thenExpectOnCurrentCompletionCallWithUpdatedValue() {

		// given
		var passedValue: String?
		let value = "test_bindable_2"
		let onCurrentClosure: ValueClosure<String> = { passedValue = $0 }
		sut = value

		// when
		token = $sut.onCurrent(completion: onCurrentClosure)

		// then
		XCTAssertEqual(value, passedValue)
    }

    func test_givenNewValue_whenSetCalled_thenExpectOnCurrentCompletionCallWithUpdatedValue() {

		// given
		var passedValue: String?
		var shouldSkip = true
		let value = "test_bindable_3"
		token = $sut.onCurrent { (receivedValue) in
			guard !shouldSkip else {
				shouldSkip = false
				return
			}

			passedValue = receivedValue
		}

		// when
		sut = value

		// then
		XCTAssertEqual(value, passedValue)
	}
}
