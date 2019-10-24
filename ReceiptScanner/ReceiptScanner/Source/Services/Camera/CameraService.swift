//
//  CameraService.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import KWFoundation

protocol CameraService {
	
	var captureSession: AVCaptureSession { get }
	var onOutputCaptured: ValueClosure<VideoOutput>? { get set }
	
	func setupSession() throws
}
