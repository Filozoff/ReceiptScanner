//
//  CameraService.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import NeuralService

protocol CameraService {
	
	var onOutputCaptured: ValueClosure<VideoOutput>? { get set }
	
	func setupSession() throws
}
