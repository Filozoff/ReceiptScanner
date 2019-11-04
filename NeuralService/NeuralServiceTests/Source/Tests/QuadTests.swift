//
//  QuadTests.swift
//  NeuralServiceTests
//
//  Created by Kamil Wyszomierski on 25/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import Vision
import XCTest
@testable import NeuralService

/// All data for `stubObservation` was taken from real rectangle observation output.
class QuadTests: XCTestCase {

	private let stubRequestRevision = 1

	private func assert(quad: Quad, file: StaticString = #file, line: UInt = #line) {
		XCTAssertLessThan(quad.topLeft.y, quad.bottomLeft.y, "top left is not less than bottom left", file: file, line: line)
		XCTAssertLessThan(quad.topRight.y, quad.bottomRight.y, "top right is not less than bottom right", file: file, line: line)
		XCTAssertLessThan(quad.topLeft.x, quad.topRight.x, "top left is not less than top right", file: file, line: line)
		XCTAssertLessThan(quad.bottomLeft.x, quad.bottomRight.x, "bottom left is not less than bottom right", file: file, line: line)
	}

	func test_givenRectangleObservationWithDownImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.394523948431015, y: 0.7210525274276733),
			bottomLeft: CGPoint(x: 0.4620596468448639, y: 0.29697078466415405),
			bottomRight: CGPoint(x: 0.665989875793457, y: 0.26437464356422424),
			topRight: CGPoint(x: 0.6570653915405273, y: 0.7364010214805603)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .down)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithDownMirroredImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.4820270240306854, y: 0.6695795655250549),
			bottomLeft: CGPoint(x: 0.42342787981033325, y: 0.4632217288017273),
			bottomRight: CGPoint(x: 0.7091426849365234, y: 0.43490564823150635),
			topRight: CGPoint(x: 0.727349579334259, y: 0.6727420687675476)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .downMirrored)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithLeftImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		// when
//		let sut = Quad(observation: stubRectangleObservation, orientation: .left)

		// then
//		assert(quad: sut)
    }

	func test_givenRectangleObservationWithLeftMirroredImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.48392418026924133, y: 0.803314208984375),
			bottomLeft: CGPoint(x: 0.17592811584472656, y: 0.6424790024757385),
			bottomRight: CGPoint(x: 0.5214925408363342, y: 0.38435810804367065),
			topRight: CGPoint(x: 0.8718987107276917, y: 0.5314085483551025)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .leftMirrored)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithRightImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.21816298365592957, y: 0.6517769694328308),
			bottomLeft: CGPoint(x: 0.2531926929950714, y: 0.3533049523830414),
			bottomRight: CGPoint(x: 0.6442488431930542, y: 0.3530949056148529),
			topRight: CGPoint(x: 0.6834632158279419, y: 0.6560050249099731)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .right)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithRightMirroredImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.21816298365592957, y: 0.6517769694328308),
			bottomLeft: CGPoint(x: 0.2531926929950714, y: 0.3533049523830414),
			bottomRight: CGPoint(x: 0.6442488431930542, y: 0.3530949056148529),
			topRight: CGPoint(x: 0.6834632158279419, y: 0.6560050249099731)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .right)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithUnknownImageOrientation_whenInitCalled_thenNormalizedQuadCreated() throws {

		// given
		let orientation = try XCTUnwrap(CGImagePropertyOrientation(rawValue: 0))
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.5379546880722046, y: 0.7174623608589172),
			bottomLeft: CGPoint(x: 0.5076324939727783, y: 0.4553472101688385),
			bottomRight: CGPoint(x: 0.6952822804450989, y: 0.3868786692619324),
			topRight: CGPoint(x: 0.721262514591217, y: 0.7262858152389526)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: orientation)

		// then
		assert(quad: sut)
	}

    func test_givenRectangleObservationWithUpImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.5379546880722046, y: 0.7174623608589172),
			bottomLeft: CGPoint(x: 0.5076324939727783, y: 0.4553472101688385),
			bottomRight: CGPoint(x: 0.6952822804450989, y: 0.3868786692619324),
			topRight: CGPoint(x: 0.721262514591217, y: 0.7262858152389526)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .up)

		// then
		assert(quad: sut)
    }

	func test_givenRectangleObservationWithUpMirroredImageOrientation_whenInitCalled_thenNormalizedQuadCreated() {

		// given
		let stubObservation = VNRectangleObservation(
			requestRevision: stubRequestRevision,
			topLeft: CGPoint(x: 0.4564513564109802, y: 0.696978747844696),
			bottomLeft: CGPoint(x: 0.45520997047424316, y: 0.454071968793869),
			bottomRight: CGPoint(x: 0.599108099937439, y: 0.39664193987846375),
			topRight: CGPoint(x: 0.6019928455352783, y: 0.6984966397285461)
		)

		// when
		let sut = Quad(observation: stubObservation, orientation: .upMirrored)

		// then
		assert(quad: sut)
    }
}
