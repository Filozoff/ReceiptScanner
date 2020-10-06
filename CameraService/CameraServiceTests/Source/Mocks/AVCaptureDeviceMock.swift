//
//  AVCaptureDeviceMock.swift
//  CameraServiceTests
//
//  Created by Kamil Wyszomierski on 01/04/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import AVKit

class AVCaptureDeviceMock: AVCaptureDevice {

	var uniqueIDStub: String!

	override var uniqueID: String {
		return uniqueIDStub
	}

	static func make(uniqueID: String) -> AVCaptureDeviceMock {
		Swizzler(objectClass: self).replace(#selector(AVCaptureDeviceMock.init(fake:)), with: #selector(NSObject.init))
		return _make(uniqueID: uniqueID)
	}

	private class func _make(uniqueID: String) -> AVCaptureDeviceMock {
		let mock = AVCaptureDeviceMock(fake: 0)
		mock.uniqueIDStub = uniqueID
		return mock
	}

	@objc dynamic convenience init(fake: Int) { fatalError("Unable to create \(Self.self)") }
}
