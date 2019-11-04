//
//  QuadExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 28/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import Vision

extension Quad {

	init(observation: VNRectangleObservation, orientation: CGImagePropertyOrientation) {
		let topLeftObservation = Point(cameraPoint: observation.topLeft, orientation: orientation)
		let bottomLeftObservation = Point(cameraPoint: observation.bottomLeft, orientation: orientation)
		let bottomRightObservation = Point(cameraPoint: observation.bottomRight, orientation: orientation)
		let topRightObservation = Point(cameraPoint: observation.topRight, orientation: orientation)
		var topLeft = topLeftObservation
		var bottomLeft = bottomLeftObservation
		var bottomRight = bottomRightObservation
		var topRight = topRightObservation

		switch orientation {
		case .down:
			topLeft = topRightObservation
			bottomLeft = topLeftObservation
			bottomRight = bottomLeftObservation
			topRight = bottomRightObservation

		case .downMirrored:
			topLeft = topLeftObservation
			bottomLeft = topRightObservation
			bottomRight = bottomRightObservation
			topRight = bottomLeftObservation

		case .left:
			// This one isn't used.
			break

		case .leftMirrored:
			topLeft = topRightObservation
			bottomLeft = bottomRightObservation
			bottomRight = bottomLeftObservation
			topRight = topLeftObservation

		case .right:
			topLeft = topLeftObservation
			bottomLeft = bottomLeftObservation
			bottomRight = bottomRightObservation
			topRight = topRightObservation

		case .rightMirrored:
			// This one isn't used.
			break

		case .up:
			topLeft = bottomLeftObservation
			bottomLeft = bottomRightObservation
			bottomRight = topRightObservation
			topRight = topLeftObservation

		case .upMirrored:
			topLeft = bottomRightObservation
			bottomLeft = bottomLeftObservation
			bottomRight = topLeftObservation
			topRight = topRightObservation

		default:
			topLeft = bottomLeftObservation
			bottomLeft = bottomRightObservation
			bottomRight = topRightObservation
			topRight = topLeftObservation
		}

		self.init(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
	}
}
