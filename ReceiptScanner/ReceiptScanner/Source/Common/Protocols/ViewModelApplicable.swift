//
//  ViewModelApplicable.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 08/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Foundation

protocol ViewModelApplicable {

	associatedtype ViewModel

	func apply(viewModel: ViewModel)
}
