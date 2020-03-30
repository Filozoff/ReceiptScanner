//
//  CaptureSession.swift
//  CameraService
//
//  Created by Kamil Wyszomierski on 08/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import Foundation

public protocol CaptureSession: AnyObject {

	var inputs: [AVCaptureInput] { get }
	var outputs: [AVCaptureOutput] { get }
	var sessionPreset: AVCaptureSession.Preset { get set }

	func addInput(_ input: AVCaptureInput)
	func addOutput(_ output: AVCaptureOutput)
	func canAddInput(_ input: AVCaptureInput) -> Bool
	func canAddOutput(_ output: AVCaptureOutput) -> Bool
	func beginConfiguration()
	func commitConfiguration()
	func startRunning()
	func stopRunning()
}
