//
//  UIViewExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import UIKit

extension UIView {

	static func make<T>(builder: ValueClosure<T>) -> T where T: UIView {
		let view = T()
		builder(view)
		return view
	}
    
    func addSubviewWithoutAutoresizingMask(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}

extension UIView: Stylable { }
