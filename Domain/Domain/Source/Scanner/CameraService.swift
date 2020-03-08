//
//  CameraService.swift
//  Domain
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import Combine

public protocol CameraService {
	
	var output: PassthroughSubject<Output, Never> { get }
	
	func setup() -> Result<AVCaptureSession, Error>
	func startSession()
	func stopSession()
}
