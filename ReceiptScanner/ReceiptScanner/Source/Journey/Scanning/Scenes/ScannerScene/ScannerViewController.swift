//
//  ScannerViewController.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

class ScannerViewController: UIViewController, BackedViewProvider {
    
    typealias BackedView = ScannerView
    
    // MARK: - Properties
    
    private let viewModel: ScannerViewModel
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.startCapturing(on: backedView.videoPreview)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.stopCapturing()
    }
}
