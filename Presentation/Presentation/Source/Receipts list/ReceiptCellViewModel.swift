//
//  ReceiptCellViewModel.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 08/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public struct ReceiptCellViewModel {

	public let dateText: String
	public let receiptNameText: String
	public let shopNameText: String

	public init(dateText: String, receiptNameText: String, shopNameText: String) {
		self.dateText = dateText
		self.receiptNameText = receiptNameText
		self.shopNameText = shopNameText
	}
}
