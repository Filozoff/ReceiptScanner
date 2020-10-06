//
//  AVCaptureDeviceInputMock.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 01/04/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit

class AVCaptureDeviceInputMock: AVCaptureDeviceInput {

	static func make(device: AVCaptureDevice) -> AVCaptureDeviceInputMock {
		Swizzler(objectClass: self).replace(#selector(AVCaptureDeviceInputMock.init(fake:)), with: #selector(NSObject.init))
		return _make(device: device)
	}

	private class func _make(device: AVCaptureDevice) -> AVCaptureDeviceInputMock {
		return AVCaptureDeviceInputMock(fake: 0)
	}

	@objc dynamic convenience init(fake: Int) { fatalError("Unable to create \(Self.self)") }
}
