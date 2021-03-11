//
//  ReceiptListViewController.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 21/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Presentation
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

		backedView.collectionView.dataSource = self
		backedView.collectionView.delegate = self
		backedView.collectionView.register(ReceiptCell.self)
    }
}

// MARK: - UICollectionViewDataSource

extension ReceiptListViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.cellViewModels.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: ReceiptCell = collectionView.dequeueReusableCell(for: indexPath)
		let cellViewModel = viewModel.cellViewModels[indexPath.row]
		cell.apply(viewModel: cellViewModel)
		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension ReceiptListViewController: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		viewModel.didSelectItem(at: indexPath)
	}
}

// MARK: - Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension ReceiptListViewController: UIViewControllerRepresentable { }

struct ReceiptListViewControllerPreview: PreviewProvider {

    static var previews: some View {
		Group {
			ForEach(ColorScheme.allCases, id: \.self) { (colorScheme) in
				ReceiptListViewController(viewModel: Self.makePreviewViewModel())
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

	private static func makePreviewViewModel() -> ReceiptListViewModel {
		let viewModel = ReceiptListViewModel()
		viewModel.cellViewModels = [
			ReceiptCellViewModel(
				dateText: "12-02-2020",
				receiptNameText: "AGD receipt",
				shopNameText: "Media Markt"
			),
			ReceiptCellViewModel(
				dateText: "12-02-2020",
				receiptNameText: "Friday's groceries",
				shopNameText: "Auchan"
			),
			ReceiptCellViewModel(
				dateText: "12-02-2020",
				receiptNameText: "Weekly shopping:\n - bean\n - apples\n - oranges\n - chocolates\n - ham\n - kielbasa\n - pierogi\n - cashews",
				shopNameText: "Lidl"
			),
			ReceiptCellViewModel(
				dateText: "12-02-2020",
				receiptNameText: "Dinner",
				shopNameText: "Nice Bistro"
			),
			ReceiptCellViewModel(
				dateText: "10-02-2020",
				receiptNameText: "Lunch",
				shopNameText: "Matchfit"
			),
			ReceiptCellViewModel(
				dateText: "01-02-2020",
				receiptNameText: "Donuuuuuuuts!!!",
				shopNameText: "Local sweets shop"
			),
			ReceiptCellViewModel(
				dateText: "10-01-2020",
				receiptNameText: "Mouse",
				shopNameText: "MediaMarkt"
			)
		]

		return viewModel
	}
}
#endif
