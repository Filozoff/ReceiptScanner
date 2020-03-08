//
//  CameraService.swift
//  Repository
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Combine

public protocol CameraService {
	
	var output: PassthroughSubject<CameraOutput, Never> { get }

	func startSession() throws
	func stopSession()
}
