//
//  BackedView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

protocol BackedViewProvider {
    
    associatedtype BackedView: UIView
    
    var backedView: BackedView { get }
}

extension BackedViewProvider where Self: UIViewController {
    
    var backedView: BackedView {
        return view as! BackedView
    }
}
