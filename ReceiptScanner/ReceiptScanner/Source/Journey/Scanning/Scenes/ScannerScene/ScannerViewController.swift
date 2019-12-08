//
//  ScannerViewController.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import UIKit

class ScannerViewController: UIViewController, BackedViewProvider {
	
	typealias BackedView = ScannerView
	
	// MARK: - Properties

	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .portrait
	}
	
	private var cancellables = [CancellationToken]()
	private var viewModel: ScannerViewModel
	
	// MARK: - Initialization
	
	init(viewModel: ScannerViewModel = ScannerViewModel()) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Lifecycle
	
	override func loadView() {
		view = ScannerView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		backedView.takePictureButton.setTitle(viewModel.takePhotoButtonTitle, for: .normal)

		viewModel.$quads.onCurrent { [weak self] (quads) in
			self?.backedView.quadOverlayView.draw(quad: quads.first)
		}
		.store(in: &cancellables)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		viewModel.observe()
		viewModel.setup { [weak self] (session) in
			self?.backedView.videoPreview.displayOutput(from: session)
		}
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		viewModel.stopObserving()
	}
}
