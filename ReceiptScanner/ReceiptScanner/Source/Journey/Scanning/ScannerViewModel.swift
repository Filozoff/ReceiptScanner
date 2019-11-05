//
//  ScannerViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 20/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import NeuralService

class ScannerViewModel {

	lazy var cameraService: CameraService = {
		return CameraServiceImpl(captureSession: captureSession)
	}()
	let rectangleDetector = DetectorFactory.makeRectangleDetector()
	let takePhotoButtonTitle = LocalizedString.takeAPhoto

	private let captureSession = AVCaptureSession()
	
	init() { }
	
	func startCapturing(setup: ValueClosure<AVCaptureSession>) {
		do {
			try cameraService.setupSession()
			setup(captureSession)
			captureSession.startRunning()
		} catch {
			// TODO: Present an error to a user.
			print(error.localizedDescription)
		}
	}
	
	func stopCapturing() {
		captureSession.stopRunning()
	}

	func observe(completion: @escaping ValueClosure<Quad>) {
		cameraService.onOutputCaptured = { [weak self] (output) in
			guard let self = self else { return }

			self.rectangleDetector.detect(from: output) { (result) in
				switch result {
				case .failure(let error):
					// TODO: Handle failure
					print(error.localizedDescription)
					
				case .success(let quad):
					DispatchQueue.main.async {
//						print("view model: \(quad)")
						completion(quad)
					}
				}
			}
		}
	}
}
