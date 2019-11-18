//
//  RectangleDetector.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 23/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import Vision
import UIKit

class RectangleDetector: RectangleDetecting {

	init() { }

	func detect(from videoOutput: VideoOutput, completion: @escaping ValueClosure<Result<[Quad], Error>>) {
		var requestOptions = [VNImageOption: Any]()
		if let videoIntrinsics = videoOutput.intrinsics {
			requestOptions = [.cameraIntrinsics: videoIntrinsics]
		}

		DispatchQueue.global(qos: .userInitiated).async { [weak self] () in
			guard let self = self else { return }

			let imageRequestHandler = VNImageRequestHandler(
				cvPixelBuffer: videoOutput.pixelBuffer,
				orientation: videoOutput.orientation,
				options: requestOptions
			)

			let request = VNDetectRectanglesRequest { [weak self] (request, error) in
				self?.handleRectangleRequest(request, error: error, orientation: videoOutput.orientation, completion: completion)
			}
			request.minimumConfidence = 0.8

			do {
				try imageRequestHandler.perform([request])
			} catch {
				completion(.failure(error))
			}
		}
	}

	private func handleRectangleRequest(
		_ request: VNRequest,
		error: Error?,
		orientation: CGImagePropertyOrientation,
		completion: @escaping ValueClosure<Result<[Quad], Error>>
	) {
		if let error = error {
			completion(.failure(error))
			return
		}

		guard let observations = request.results as? [VNRectangleObservation] else {
			completion(.failure(RectangleDetectorError.cannotConvertToRectangleObservation))
			return
		}

		let quads = observations.map { Quad(observation: $0, orientation: orientation) }
		completion(.success(quads))
	}
}
