//
//  CameraServiceImplTests.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 08/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import XCTest
@testable import CameraService

class CameraServiceImplTests: XCTestCase {

	private let captureSessionMock = CaptureSessionMock()
	private lazy var sut = CameraServiceImpl(session: captureSessionMock)

	// MARK: - status

    func test_whenStatusCalled_thenStatusEqualToNotConfigured() {

		// given
		// when
		// then
		XCTAssertEqual(sut.status, .notConfigured)
    }

	func test_whenStartSessionCalled_thenStatusEqualToRunning() throws {

		// given
		// when
		try sut.startSession()

		// then
		XCTAssertEqual(sut.status, .running)
	}
}
