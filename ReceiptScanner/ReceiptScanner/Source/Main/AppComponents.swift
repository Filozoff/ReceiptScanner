//
//  AppComponents.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 07/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import CameraService
import Domain
import Foundation
import Repository

struct AppComponents {

	static var shared = AppComponents()

	lazy var cameraService: CameraServiceProtocol = CameraService(
		session: captureSession,
		captureDeviceFactory: CaptureDeviceFactory()
	)
	
	lazy var captureSession = AVCaptureSession()
	lazy var scannerRepository: ScannerRepositoryProtocol = ScannerRepository(cameraService: cameraService)
	lazy var scannerUseCase: ScannerUseCaseProtocol = ScannerUseCase(scannerRepository: scannerRepository)
}

extension AVCaptureSession: CaptureSession { }
