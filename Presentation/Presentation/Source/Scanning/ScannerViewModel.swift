//
//  ScannerViewModel.swift
//  Presentation
//
//  Created by Kamil Wyszomierski on 20/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Combine
import Domain
import KWFoundation

public class ScannerViewModel {

	@Published public var quads = [Quad]()

	// TODO:
	public let takePhotoButtonTitle = ""

	private var cancellables = [AnyCancellable]()
	private let scannerUseCase: ScannerUseCaseProtocol
	
	public init(scannerUseCase: ScannerUseCaseProtocol) {
		self.scannerUseCase = scannerUseCase
	}

	public func viewDidAppear() {
		scannerUseCase.execute { [weak self] result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)

			case .success(let quads):
				self?.quads = quads
			}
		}
	}

	public func viewDidDisappear() {
		scannerUseCase.stopObservation()
	}
}
