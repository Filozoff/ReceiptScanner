//
//  ScannerViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 20/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import CameraService
import Combine
import NeuralService

public class ScannerViewModel {

	@Published public var quads = [Quad]()

	// TODO:
	public let takePhotoButtonTitle = ""

	private var cameraService: CameraService
	private var cancellables = [AnyCancellable]()
	private let rectangleDetector = DetectorFactory.makeRectangleDetector()
	
	public init(cameraService: CameraService) {
		self.cameraService = cameraService
	}

	public func setup() -> Result<AVCaptureSession, Error> {
		return cameraService.setup()
	}

	public func observe() {
		cameraService.startSession()
		cameraService.output.sink { [weak self] (output) in
			guard let self = self else { return }

			let output = CameraOutput(
				pixelBuffer: output.pixelBuffer,
				orientation: output.orientation,
				intrinsics: output.intrinsics
			)

			self.rectangleDetector.detect(from: output) { (result) in
				switch result {
				case .failure(let error):
					// TODO: Handle failure
					print(error.localizedDescription)

				case .success(let quads):
					DispatchQueue.main.async {
						self.quads = quads
					}
				}
			}
		}
		.store(in: &cancellables)
	}
	
	public func stopObserving() {
		cameraService.stopSession()
	}
}
