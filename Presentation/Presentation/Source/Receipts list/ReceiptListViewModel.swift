//
//  ReceiptListViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 24/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation

public struct ReceiptListViewModel {

	@Observed public var receipts = [ReceiptCellViewModel]()

	public init() {
		receipts = [
			ReceiptCellViewModel(
				receiptNameText: "AGD receipt",
				shopNameText: "Media Markt"
			),
			ReceiptCellViewModel(
				receiptNameText: "Friday's groceries",
				shopNameText: "Auchan"
			),
			ReceiptCellViewModel(
				receiptNameText: "Weekly shopping:\n - bean\n - apples\n - oranges\n - chocolates\n - ham\n - kielbasa\n - pierogi\n - cashews",
				shopNameText: "Lidl"
			),
			ReceiptCellViewModel(
				receiptNameText: "Dinner",
				shopNameText: "Nice Bistro"
			)
		]
	}
}
