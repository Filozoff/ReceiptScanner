//
//  CaptureDeviceFactory.swift
//  CameraService
//
//  Created by Kamil Wyszomierski on 30/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit

public protocol CaptureDeviceFactory {

	func makeBuildInWideBackVideoDevice() -> AVCaptureDevice?
	func makeCaptureDeviceInput(device: AVCaptureDevice) throws -> AVCaptureDeviceInput
}

public struct CaptureDeviceFactoryImpl: CaptureDeviceFactory {

	public init() { }

	public func makeBuildInWideBackVideoDevice() -> AVCaptureDevice? {
		return AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
	}

	public func makeCaptureDeviceInput(device: AVCaptureDevice) throws -> AVCaptureDeviceInput {
		return try AVCaptureDeviceInput(device: device)
	}
}
