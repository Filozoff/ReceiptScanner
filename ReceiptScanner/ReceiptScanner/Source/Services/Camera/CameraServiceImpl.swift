//
//  CameraServiceImpl.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 23/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import NeuralService

class CameraServiceImpl: NSObject, CameraService {

	// MARK: - Properties

	var onOutputCaptured: ValueClosure<VideoOutput>?

	private let captureSession: AVCaptureSession
	private let outputQueue = DispatchQueue(label: "camera.output")

	// MARK: - Initialization

	init(captureSession: AVCaptureSession) {
		self.captureSession = captureSession
	}

	// MARK: - Session

	func setupSession() throws {
		captureSession.beginConfiguration()
		try addInput()
		try addOutput()
		captureSession.commitConfiguration()
	}

	private func addOutput() throws {
		let output = AVCaptureVideoDataOutput()
		output.setSampleBufferDelegate(self, queue: outputQueue)
		guard captureSession.canAddOutput(output) else {
			throw CameraServiceError.cannotAddPhotoOutputToSession
		}

		captureSession.sessionPreset = .inputPriority
		captureSession.addOutput(output)
	}

	private func addInput() throws {
		guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
			throw CameraServiceError.cannotFindVideoDevice
		}

		let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
		guard captureSession.canAddInput(videoDeviceInput) else {
			throw CameraServiceError.cannotAddDeviceInputToSession
		}

		captureSession.addInput(videoDeviceInput)
	}
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension CameraServiceImpl: AVCaptureVideoDataOutputSampleBufferDelegate {

	func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
		guard
			let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
			let exifOrientation = CGImagePropertyOrientation(rawValue: UInt32(UIDevice.current.orientation.rawValue))
		else { return }

		let cameraIntrinsicData = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil)
		let output = VideoOutput(pixelBuffer: pixelBuffer, orientation: exifOrientation, intrinsics: cameraIntrinsicData)
		onOutputCaptured?(output)
	}
}
