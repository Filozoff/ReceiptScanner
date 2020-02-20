//
//  CameraServiceError.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

enum CameraServiceError: Error {
	case cannotAddDeviceInputToSession
	case cannotAddPhotoOutputToSession
	case cannotFindVideoDevice
}
