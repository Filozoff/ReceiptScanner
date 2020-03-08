//
//  ScannerUseCase.swift
//  Domain
//
//  Created by Kamil Wyszomierski on 24/02/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import Combine
import KWFoundation

public protocol ScannerUseCase {

	func execute(completion: @escaping ValueClosure<Result<[Quad], Error>>)
	func stopObservation()
}

public struct ScannerUseCaseImpl: ScannerUseCase {

	let scannerRepository: ScannerRepository

	public init(scannerRepository: ScannerRepository) {
		self.scannerRepository = scannerRepository
	}
	
	public func execute(completion: @escaping ValueClosure<Result<[Quad], Error>>) {
		scannerRepository.startObservation(completion: completion)
	}

	public func stopObservation() {
		scannerRepository.stopObservation()
	}
}
