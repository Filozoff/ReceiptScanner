//
//  CaptureSessionMock.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 08/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import Foundation
@testable import CameraService

class CaptureSessionMock: CaptureSession {

	var sessionPreset: AVCaptureSession.Preset = .high

	private(set) var inputs = [AVCaptureInput]()
	private(set) var outputs = [AVCaptureOutput]()

	func addInput(_ input: AVCaptureInput) {
		inputs.append(input)
	}

	func addOutput(_ output: AVCaptureOutput) {
		outputs.append(output)
	}

	func canAddInput(_ input: AVCaptureInput) -> Bool {
		return true
	}

	func canAddOutput(_ output: AVCaptureOutput) -> Bool {
		return true
	}

	func beginConfiguration() {

	}

	func commitConfiguration() {

	}

	func startRunning() {

	}

	func stopRunning() {

	}
}
