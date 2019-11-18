//
//  PointTests.swift
//  NeuralServiceTests
//
//  Created by Kamil Wyszomierski on 15/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import Vision
import XCTest
@testable import NeuralService

class PointTests: XCTestCase {

	private let stubX = 0.1
	private let stubY = 0.7
	private lazy var stubCameraPoint = CGPoint(x: stubX, y: stubY)

	func test_givenCameraPointWithDownImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .down)

		// then
		let expected = Point(x: 1.0 - stubY, y: 1.0 - stubX)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithDownMirroredImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .downMirrored)

		// then
		let expected = Point(x: 1.0 - stubY, y: stubX)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithLeftImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .left)

		// then
		let expected = Point(x: 1.0 - stubX, y: stubY)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithLeftMirroredImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .leftMirrored)

		// then
		let expected = Point(x: 1.0 - stubX, y: 1.0 - stubY)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithRightImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .right)

		// then
		let expected = Point(x: stubX, y: 1.0 - stubY)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithRightMirroredImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .rightMirrored)

		// then
		let expected = Point(x: stubX, y: stubY)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithUnknownImageOrientation_whenInitCalled_thenNormalizedPointCreated() throws {

		// given
		let orientation = try XCTUnwrap(CGImagePropertyOrientation(rawValue: 0))

		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: orientation)

		// then
		let expected = Point(x: stubY, y: stubX)
		XCTAssertEqual(sut, expected)
	}

    func test_givenCameraPointWithUpImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .up)

		// then
		let expected = Point(x: stubY, y: stubX)
		XCTAssertEqual(sut, expected)
    }

	func test_givenCameraPointWithUpMirroredImageOrientation_whenInitCalled_thenNormalizedPointCreated() {

		// given
		// when
		let sut = Point(cameraPoint: stubCameraPoint, orientation: .upMirrored)

		// then
		let expected = Point(x: stubY, y: 1.0 - stubX)
		XCTAssertEqual(sut, expected)
    }
}
