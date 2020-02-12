//
//  UIViewPreview.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 16/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView> {

    let view: View

    init(_ builder: @escaping () -> View) {
        view = builder()
    }
}

// MARK: - UIViewRepresentable

extension UIViewPreview: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
		view.setContentHuggingPriority(.important, for: .horizontal)
        view.setContentHuggingPriority(.important, for: .vertical)
    }
}
#endif
