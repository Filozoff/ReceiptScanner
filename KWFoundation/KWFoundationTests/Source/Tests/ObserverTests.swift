//
//  ObserverTests.swift
//  KWFoundationTests
//
//  Created by Kamil Wyszomierski on 06/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import KWFoundation

class ObserverTests: XCTestCase {

	private let stubObject = StubClass()
	private let stubValue = "test_value_1"
	private var token: CancellationToken!

	// MARK: - subscribers

    func test_givenToken_whenOnCurrentCalled_thenNumberOfSubsribersIncreased() {

		// given
		let sut = Observer(value: stubValue)

		// when
		token = sut.onCurrent { _ in }

		// then
		XCTAssertNotNil(token)
		XCTAssertEqual(sut.subscribers.count, 1)
    }

	func test_givenToken_whenBindCalled_thenNumberOfSubsribersIncreased() {

		// given
		let sut = Observer(value: stubValue)

		// when
		token = sut.bind(to: stubObject, for: \.stringProperty)

		// then
		XCTAssertNotNil(token)
		XCTAssertEqual(sut.subscribers.count, 1)
	}

	func test_givenNullifiedToken_whenOnCurrentCalled_thenNumberOfSubsribersDidNotChanged() {

		// given
		let sut = Observer(value: stubValue)

		// when
		_ = sut.onCurrent { _ in }

		// then
		XCTAssertTrue(sut.subscribers.isEmpty)
    }

	func test_givenNullifiedToken_whenBindCalled_thenNumberOfSubsribersDidNotChanged() {

		// given
		let sut = Observer(value: stubValue)

		// when
		_ = sut.bind(to: stubObject, for: \.stringProperty)

		// then
		XCTAssertTrue(sut.subscribers.isEmpty)
	}

	// MARK: - bind

	func test_givenStubObjectWithKeyPath_whenBindCalled_thenObjectIsUpdatedWithInitialValue() {

		// given
		let sut = Observer(value: stubValue)

		// when
		token = sut.bind(to: stubObject, for: \.stringProperty)

		// then
		XCTAssertEqual(stubObject.stringProperty, stubValue)
	}

	func test_givenValue_whenBindCalled_thenObjectIsUpdatedWithNewValue() {

		// given
		let valueToSet = "new_value_2311"
		let sut = Observer(value: stubValue)
		token = sut.bind(to: stubObject, for: \.stringProperty)

		// when
		sut.set(value: valueToSet)

		// then
		XCTAssertEqual(stubObject.stringProperty, valueToSet)
	}

	// MARK: - onCurrent closure

	func test_givenOnCurrentClosure_whenOnCurrentCalled_thenOnCurrentClosureIsCalled() {

		// given
		var isOnCurrentCalled = false
		let sut = Observer(value: stubValue)
		let onCurrentClosure: ValueClosure<String> = { _ in
			isOnCurrentCalled = true
		}

		// when
		_ = sut.onCurrent(completion: onCurrentClosure)

		// then
		XCTAssertTrue(isOnCurrentCalled)
	}

	func test_givenOnCurrentClosure_whenOnCurrentCalledWithTokenStored_thenOnCurrentClosureIsCalled() {

		// given
		var isOnCurrentCalled = false
		let sut = Observer(value: stubValue)
		let onCurrentClosure: ValueClosure<String> = { _ in
			isOnCurrentCalled = true
		}

		// when
		token = sut.onCurrent(completion: onCurrentClosure)

		// then
		XCTAssertNotNil(token)
		XCTAssertTrue(isOnCurrentCalled)
	}

	func test_givenValue_whenSetValueCalled_thenOnCurrentClosureCalledTwice() {

		// given
		let valueToSet = "test_value_234"
		var numberOfOnCurrentClosureCalls = 0
		let sut = Observer(value: stubValue)
		let onCurrentClosure: ValueClosure<String> = { _ in
			numberOfOnCurrentClosureCalls += 1
		}
		token = sut.onCurrent(completion: onCurrentClosure)

		// when
		sut.set(value: valueToSet)

		// then
		XCTAssertNotNil(token)
		XCTAssertEqual(numberOfOnCurrentClosureCalls, 2)
	}

	// MARK: - onCurrent closure passed value

	func test_givenValue_whenSetValueCalled_thenOnCurrentClosurePassedValueEqualsToValueSet() {

		// given
		var passedValue: String?
		let valueToSet = "test_value_234"
		let sut = Observer(value: stubValue)
		let onCurrentClosure: ValueClosure<String> = { passedValue = $0 }
		token = sut.onCurrent(completion: onCurrentClosure)

		// when
		sut.set(value: valueToSet)

		// then
		XCTAssertNotNil(token)
		XCTAssertEqual(passedValue, valueToSet)
	}

	func test_givenOnCurrentClosure_whenOnCurrentCalled_thenOnCurrentClosurePassedValueEqualsToInitialValue() {

		// given
		var passedValue: String?
		let sut = Observer(value: stubValue)
		let onCurrentClosure: ValueClosure<String> = { passedValue = $0 }

		// when
		token = sut.onCurrent(completion: onCurrentClosure)

		// then
		XCTAssertNotNil(token)
		XCTAssertEqual(passedValue, stubValue)
	}
}
