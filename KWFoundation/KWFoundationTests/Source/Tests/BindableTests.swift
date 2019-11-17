//
//  BindableTests.swift
//  KWFoundationTests
//
//  Created by Kamil Wyszomierski on 17/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import KWFoundation

class BindableTests: XCTestCase {

	@Bindable private var sut = "test_bindable"
	private let expectationMessage = "Expect completion to be called."

	func test_givenValue_whenOnCurrentCalled_thenExpectOnCurrentCompletionCallWithCurrentValue() {

		// given
		let expect = expectation(description: expectationMessage)

		// when
		$sut.onCurrent { [weak self] (receivedValue) in
			guard let self = self else { return }
			expect.fulfill()
			XCTAssertEqual(self.sut, receivedValue)
		}

		// then
		wait(for: [expect], timeout: 1.0)
	}

    func test_givenNewValue_whenOnCurrentCalled_thenExpectOnCurrentCompletionCallWithUpdatedValue() {

		// given
		let expect = expectation(description: expectationMessage)
		let value = "test_bindable_2"
		sut = value

		// when
		$sut.onCurrent { (receivedValue) in
			expect.fulfill()
			XCTAssertEqual(value, receivedValue)
		}

		// then
		wait(for: [expect], timeout: 1.0)
    }

    func test_givenNewValue_whenSetCalled_thenExpectOnCurrentCompletionCallWithUpdatedValue() {

		// given
		let expect = expectation(description: expectationMessage)
		var shouldSkip = true
		let value = "test_bindable_3"
		$sut.onCurrent { (receivedValue) in
			guard !shouldSkip else {
				shouldSkip = false
				return
			}

			expect.fulfill()
			XCTAssertEqual(value, receivedValue)
		}

		// when
		sut = value

		// then
		wait(for: [expect], timeout: 1.0)
	}
}
