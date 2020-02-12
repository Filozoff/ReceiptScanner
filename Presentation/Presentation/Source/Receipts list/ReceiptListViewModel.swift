//
//  ReceiptListViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 24/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Combine
import KWFoundation

public class ReceiptListViewModel {

	@Published public var receipts = [ReceiptCellViewModel]()

	public init() {
		receipts = [
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
