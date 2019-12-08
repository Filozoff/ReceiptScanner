//
//  CancellationTokenTests.swift
//  KWFoundationTests
//
//  Created by Kamil Wyszomierski on 02/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import KWFoundation

class CancellationTokenTests: XCTestCase {

	// MARK: - cancel

    func test_givenCancelClosure_whenCancellCalled_thenCancelClosureIsCalled() {

		// given
		var isCancelCalled = false
		let cancelClosure = {
			isCancelCalled = true
		}

		let sut = CancellationToken(cancelClosure)

		// when
		sut.cancel()

		// then
		XCTAssertTrue(isCancelCalled)
    }

	func test_givenCancelClosure_whenDeinitCalled_thenCancelClosureIsCalled() {

		// given
		var isCancelCalled = false
		let cancelClosure = {
			isCancelCalled = true
		}

		// when
		_ = CancellationToken(cancelClosure)
		
		// then
		XCTAssertTrue(isCancelCalled)
	}

	// MARK: - store

	func text_givenCancellablesArray_whenStoreInCalled_thenNumberOfCancellablesIncreased() {

		// given
		var cancellations = [CancellationToken]()
		let sut = CancellationToken { }

		// when
		sut.store(in: &cancellations)

		// then
		XCTAssertEqual(cancellations.count, 1)
	}

	func text_givenCancellablesSet_whenStoreInCalled_thenNumberOfCancellablesIncreased() {

		// given
		var cancellations = Set<CancellationToken>()
		let sut = CancellationToken { }

		// when
		sut.store(in: &cancellations)

		// then
		XCTAssertEqual(cancellations.count, 1)
	}
}
