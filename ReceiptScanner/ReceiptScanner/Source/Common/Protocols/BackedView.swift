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
        guard let view = view as? BackedView else {
            fatalError("Cannot get `backedView` because `view` setted for `\(Self.self)` is not a type of `\(Self.BackedView.self)`.")
        }
        
        return view
    }
}
