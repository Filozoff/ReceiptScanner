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

		NSLayoutConstraint.activate([
			scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			scanButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
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
