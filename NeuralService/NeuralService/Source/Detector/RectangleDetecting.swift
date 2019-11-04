//
//  RectangleDetecting.swift
//  NeuralService
//
//  Created by Kamil Wyszomierski on 04/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public protocol RectangleDetecting {

	func detect(from videoOutput: VideoOutput, completion: @escaping ValueClosure<Result<Quad, Error>>)
}
