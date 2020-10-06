//
//  CaptureDeviceFactoryMock.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 30/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit
@testable import CameraService

struct CaptureDeviceFactoryMock: CaptureDeviceFactory {

	private let wideBackVideoDeviceID = "com.apple.avfoundation.avcapturedevice.built-in_video:0"

	func makeBuildInWideBackVideoDevice() -> AVCaptureDevice? {
		return AVCaptureDeviceMock.make(uniqueID: wideBackVideoDeviceID)
	}

	func makeCaptureDeviceInput(device: AVCaptureDevice) throws -> AVCaptureDeviceInput {
		return AVCaptureDeviceInputMock.make(device: device)
	}
}
