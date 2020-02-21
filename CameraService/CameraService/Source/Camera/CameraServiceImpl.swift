//
//  CameraServiceImpl.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 23/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import Combine

public class CameraServiceImpl: NSObject, CameraService {

	// MARK: - Properties

	public let output = PassthroughSubject<Output, Never>()

	private let captureSession = AVCaptureSession()
	private let outputQueue = DispatchQueue(label: "camera.output")

	// MARK: - Initialization

	// MARK: - Session

	public func setup() -> Result<AVCaptureSession, Error> {
		return Result { [unowned self] () -> AVCaptureSession in
			self.captureSession.beginConfiguration()
			try self.addInput()
			try self.addOutput()
			self.captureSession.commitConfiguration()
			return self.captureSession
		}
	}

	public func startSession() {
		captureSession.startRunning()
	}

	public func stopSession() {
		captureSession.stopRunning()
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

	public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
		guard
			let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
			let exifOrientation = CGImagePropertyOrientation(rawValue: UInt32(UIDevice.current.orientation.rawValue))
		else { return }

		let cameraIntrinsicData = CMGetAttachment(
			sampleBuffer,
			key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix,
			attachmentModeOut: nil
		)
		let output = Output(pixelBuffer: pixelBuffer, orientation: exifOrientation, intrinsics: cameraIntrinsicData)
		self.output.send(output)
	}
}
