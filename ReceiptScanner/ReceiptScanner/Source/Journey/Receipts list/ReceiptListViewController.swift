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

	private let cellIdentifier = "\(UICollectionViewCell.self)"
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

		backedView.collectionView.dataSource = self
		backedView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension ReceiptListViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 21
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
		cell.contentView.backgroundColor = .red
		return cell
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
