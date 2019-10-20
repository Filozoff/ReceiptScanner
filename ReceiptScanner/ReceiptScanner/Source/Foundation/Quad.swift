//
//  Quad.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

struct Quad {
    
    var topLeft: Float
    var topRight: Float
    var bottomRight: Float
    var bottomLeft: Float
}

extension Quad {
    
    static let zero = Quad(topLeft: 0.0, topRight: 0.0, bottomRight: 0.0, bottomLeft: 0.0)
}
