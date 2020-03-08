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

	lazy var cameraService: CameraService = CameraServiceImpl(session: captureSession)
	lazy var captureSession = AVCaptureSession()
	lazy var scannerRepository: ScannerRepository = ScannerRepositoryImpl(cameraService: cameraService)
	lazy var scannerUseCase: ScannerUseCase = ScannerUseCaseImpl(scannerRepository: scannerRepository)
}
