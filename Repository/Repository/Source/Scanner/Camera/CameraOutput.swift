//
//  CameraOutput.swift
//  Repository
//
//  Created by Kamil Wyszomierski on 20/02/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import CoreVideo
import ImageIO

public class CameraOutput {

	public let pixelBuffer: CVImageBuffer
	public let orientation: CGImagePropertyOrientation
	public let intrinsics: CFTypeRef?

	public init(pixelBuffer: CVImageBuffer, orientation: CGImagePropertyOrientation, intrinsics: CFTypeRef?) {
		self.pixelBuffer = pixelBuffer
		self.orientation = orientation
		self.intrinsics = intrinsics
	}
}
