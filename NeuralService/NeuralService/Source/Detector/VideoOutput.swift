//
//  VideoOutput.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 23/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import CoreVideo
import ImageIO

public class VideoOutput {

	public let pixelBuffer: CVImageBuffer
	public let orientation: CGImagePropertyOrientation
	public let intrinsics: CFTypeRef?

	public init(pixelBuffer: CVImageBuffer, orientation: CGImagePropertyOrientation, intrinsics: CFTypeRef?) {
		self.pixelBuffer = pixelBuffer
		self.orientation = orientation
		self.intrinsics = intrinsics
	}
}
