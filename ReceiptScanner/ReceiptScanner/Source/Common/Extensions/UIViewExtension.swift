//
//  UIViewExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviewWithoutAutoresizingMask(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}

extension UIView: Stylable { }
