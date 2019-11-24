//
//  BackedView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

protocol BackedViewProvider {
    
    associatedtype View: UIView
    
    var backedView: View { get }
}

extension BackedViewProvider where Self: UIViewController {
    
    var backedView: View {
        guard let view = view as? View else {
            fatalError("Cannot get `backedView` because `view` setted for `\(Self.self)` is not a type of `\(Self.View.self)`.")
        }
        
        return view
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension BackedViewProvider where Self: UIViewControllerRepresentable {

	typealias UIViewControllerType = Self

	func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> Self { return self }
	func updateUIViewController(_ uiViewController: Self, context: UIViewControllerRepresentableContext<Self>) { }
}
#endif
