//
//  VideoOutput.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 23/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import CoreVideo
import ImageIO

class VideoOutput {

	let pixelBuffer: CVImageBuffer
	let orientation: CGImagePropertyOrientation
	let intrinsics: CFTypeRef?

	init(pixelBuffer: CVImageBuffer, orientation: CGImagePropertyOrientation, intrinsics: CFTypeRef?) {
		self.pixelBuffer = pixelBuffer
		self.orientation = orientation
		self.intrinsics = intrinsics
	}
}
