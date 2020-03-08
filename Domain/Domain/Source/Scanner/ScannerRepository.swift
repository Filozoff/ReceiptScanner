//
//  ScannerRepository.swift
//  Domain
//
//  Created by Kamil Wyszomierski on 24/02/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import KWFoundation

public protocol ScannerRepository {

	func startObservation(completion: ValueClosure<Result<[Quad], Error>>)
	func stopObservation()
}
