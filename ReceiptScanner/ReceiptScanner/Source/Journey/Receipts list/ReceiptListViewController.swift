//
//  ReceiptListViewController.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 21/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

final class ReceiptListViewController: UIViewController, BackedViewProvider {

	typealias View = ReceiptListView

	private var viewModel: ReceiptListViewModel

	init(viewModel: ReceiptListViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		view = ReceiptListView()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		backedView.titleLabel.text = viewModel.title
		backedView.firstHeader.text = "h1"
		backedView.secondaryHeader.text = "h2"
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension ReceiptListViewController: UIViewControllerRepresentable { }

struct ReceiptListViewControllerPreview: PreviewProvider {

    static var previews: some View {
		Group {
			ForEach(ColorScheme.allCases, id: \.self) { (colorScheme) in
				ReceiptListViewController(viewModel: ReceiptListViewModel())
					.edgesIgnoringSafeArea(.all)
					.environment(\.colorScheme, colorScheme)
					.previewDisplayName("\(colorScheme)")
			}
//			ForEach(ContentSizeCategory.allCases, id: \.self) { (contentSize) in
//				ReceiptListViewController(viewModel: ReceiptListViewModel())
//					.edgesIgnoringSafeArea(.all)
//					.environment(\.sizeCategory, contentSize)
//					.previewDisplayName("\(contentSize)")
//			}
		}
    }
}
#endif
