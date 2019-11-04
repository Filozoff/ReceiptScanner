//
//  PointExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 26/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import ImageIO

extension Point {

	init(cameraPoint: CGPoint, orientation: CGImagePropertyOrientation) {
		switch orientation {
		case .down:
			self.init(x: 1.0 - Double(cameraPoint.y), y: 1.0 - Double(cameraPoint.x))

		case .downMirrored:
			self.init(x: 1.0 - Double(cameraPoint.y), y: Double(cameraPoint.x))

		case .left:
			self.init(x: 1.0 - Double(cameraPoint.x), y: Double(cameraPoint.y))

		case .leftMirrored:
			self.init(x: 1.0 - Double(cameraPoint.x), y: 1.0 - Double(cameraPoint.y))

		case .right:
			self.init(x: Double(cameraPoint.x), y: 1.0 - Double(cameraPoint.y))

		case .rightMirrored:
			self.init(x: Double(cameraPoint.x), y: Double(cameraPoint.y))

		case .up:
			self.init(x: Double(cameraPoint.y), y: Double(cameraPoint.x))

		case .upMirrored:
			self.init(x: Double(cameraPoint.y), y: 1.0 - Double(cameraPoint.x))

		default:
			self.init(x: Double(cameraPoint.y), y: Double(cameraPoint.x))
		}
	}
}
