//
//  ScannerViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 20/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

struct ScannerViewModel {
    
    let takePhotoButtonTitle = LocalizedString.takeAPhoto
    
    private let cameraService: CameraService
    
    init(cameraService: CameraService = CameraServiceImpl()) {
        self.cameraService = cameraService
    }
    
    func startCapturing(on view: VideoPreviewView) {
        do {
            try cameraService.setupSession()
            view.displayOutput(from: cameraService.captureSession)
            cameraService.captureSession.startRunning()
        } catch {
            // TODO: Present an error to a user.
            print(error.localizedDescription)
        }
    }
    
    func stopCapturing() {
        cameraService.captureSession.stopRunning()
    }
}
