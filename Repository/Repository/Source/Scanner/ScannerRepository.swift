//
//  ScannerRepository.swift
//  Repository
//
//  Created by Kamil Wyszomierski on 06/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import Combine
import Domain
import KWFoundation

public class ScannerRepository {

	let cameraService: CameraServiceProtocol

	private var cancellables = [AnyCancellable]()

	public init(cameraService: CameraServiceProtocol) {
		self.cameraService = cameraService
	}
}

extension ScannerRepository: ScannerRepositoryProtocol {

	public func startObservation(completion: ValueClosure<Result<[Quad], Error>>) {

		cameraService.output.sink { [weak self] output in
			guard let self = self else { return }

			let output = CameraOutput(
				pixelBuffer: output.pixelBuffer,
				orientation: output.orientation,
				intrinsics: output.intrinsics
			)

//			self.rectangleDetector.detect(from: output) { (result) in
//				switch result {
//				case .failure(let error):
//					// TODO: Handle failure
//					print(error.localizedDescription)
//
//				case .success(let quads):
//					DispatchQueue.main.async {
//						self.quads = quads
//					}
//				}
//			}
		}
		.store(in: &cancellables)

		do {
			try cameraService.startSession()
		} catch {
			completion(.failure(error))
		}
	}

	public func stopObservation() {
		cameraService.stopSession()
	}
}
