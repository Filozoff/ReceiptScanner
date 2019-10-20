//
//  CameraService.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit

protocol CameraService {
    
    var captureSession: AVCaptureSession { get }
    
    func setupSession() throws
}

class CameraServiceImpl: CameraService {
    
    // MARK: - Properties
    
    let captureSession = AVCaptureSession()
    
    // MARK: - Initialization
    
    init() { }
    
    // MARK: -
    
    func setupSession() throws {
        captureSession.beginConfiguration()
        try addVideoDeviceInput()
        try addPhotoOutput()
        captureSession.commitConfiguration()
    }
    
    private func addPhotoOutput() throws {
        let photoOutput = AVCapturePhotoOutput()
        photoOutput.isHighResolutionCaptureEnabled = true
        guard captureSession.canAddOutput(photoOutput) else {
            throw CameraServiceError.cannotAddPhotoOutputToSession
        }
        
        captureSession.sessionPreset = .inputPriority
        captureSession.addOutput(photoOutput)
    }
    
    private func addVideoDeviceInput() throws {
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            throw CameraServiceError.cannotFindVideoDevice
        }
        
        let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
        guard captureSession.canAddInput(videoDeviceInput) else {
            throw CameraServiceError.cannotAddDeviceInputToSession
        }
        
        captureSession.addInput(videoDeviceInput)
    }
}
