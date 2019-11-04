//
//  DetectorFactory.swift
//  NeuralService
//
//  Created by Kamil Wyszomierski on 04/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public class DetectorFactory {

	public static func makeRectangleDetector() -> RectangleDetecting {
		return RectangleDetector()
	}
}
