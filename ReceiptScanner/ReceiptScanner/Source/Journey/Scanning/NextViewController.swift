//
//  NextViewController.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 08/03/2020.
//  Copyright © 2020 Kamil Wyszomierski. All rights reserved.
//

import Presentation
import UIKit

class NextViewController: UIViewController {

	override func loadView() {
		view = UIView()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .white

		let scanButton = UIButton(type: .system)
		scanButton.addTarget(self, action: #selector(didTouch(scanButton:)), for: .touchUpInside)
		scanButton.setTitle("Scan", for: .normal)
		scanButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(scanButton)

		let receiptListButton = UIButton(type: .system)
		receiptListButton.addTarget(self, action: #selector(didTouch(receiptListButton:)), for: .touchUpInside)
		receiptListButton.setTitle("Receipts", for: .normal)
		receiptListButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(receiptListButton)

		NSLayoutConstraint.activate([
			scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			scanButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])

		NSLayoutConstraint.activate([
			receiptListButton.topAnchor.constraint(equalTo: scanButton.bottomAnchor, constant: 20.0),
			receiptListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
    }

	@objc private func didTouch(receiptListButton: UIButton) {
		let itemListViewController = ReceiptListViewController(
			viewModel: ReceiptListViewModel()
		)
		navigationController?.pushViewController(itemListViewController, animated: true)
	}

	@objc private func didTouch(scanButton: UIButton) {
		let scanViewController = ScannerViewController(
			viewModel: ScannerViewModel(
				scannerUseCase: AppComponents.shared.scannerUseCase
			)
		)
		navigationController?.pushViewController(scanViewController, animated: true)
	}
}
