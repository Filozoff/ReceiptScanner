//
//  CellIdentifiable.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 10/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

protocol CellIdentifiable {

	static var reuseIdentifier: String { get }
}

extension CellIdentifiable {

	static var reuseIdentifier: String {
		return "\(Self.self)"
	}
}
