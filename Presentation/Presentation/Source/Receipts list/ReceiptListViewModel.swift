//
//  ReceiptListViewModel.swift
//  CameraService
//
//  Created by Kamil Wyszomierski on 24/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation
import Combine
import KWFoundation

public class ReceiptListViewModel {

	@Published public var cellViewModels = [ReceiptCellViewModel]()

	var onCellViewModelSelected: ValueClosure<ReceiptCellViewModel>?

	public init() {
		cellViewModels = Self.makeCellViewModels()
	}
	
	public func didSelectItem(at indexPath: IndexPath) {
		onCellViewModelSelected?(cellViewModels[indexPath.endIndex])
	}
}

// MARK: - Temporary

extension ReceiptListViewModel {

	private static func makeCellViewModels() -> [ReceiptCellViewModel] {
		return [
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
				dateText: "11-02-2020",
				receiptNameText: "Weekly shopping:\n - bean\n - apples\n - oranges\n - chocolates\n - ham\n - kielbasa\n - pierogi\n - cashews",
				shopNameText: "Lidl"
			),
			ReceiptCellViewModel(
				dateText: "10-02-2020",
				receiptNameText: "Dinner",
				shopNameText: "Nice Bistro"
			)
		]
	}
}
