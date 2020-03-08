//
//  ScannerView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

class ScannerView: UIView {
	
	// MARK: - Properties
	
	let quadOverlayView = QuadOverlayView()
	let takePictureButton = UIButton(type: .system)
	let videoPreview = VideoPreviewView()
	
	// MARK: - Initialization
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .black
		clipsToBounds = true
		addSubviewWithoutAutoresizingMask(videoPreview)
		
		addSubviewWithoutAutoresizingMask(quadOverlayView)

		takePictureButton.apply(style: .mainAction)
		addSubviewWithoutAutoresizingMask(takePictureButton)
		
		setNeedsUpdateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Lifecycle
	
	// MARK: - Updates
	
	override func updateConstraints() {
		let ratio: CGFloat = 16.0 / 9.0
		
		NSLayoutConstraint.activate([
			videoPreview.topAnchor.constraint(equalTo: topAnchor),
			videoPreview.bottomAnchor.constraint(equalTo: bottomAnchor),
			videoPreview.centerXAnchor.constraint(equalTo: centerXAnchor),
			videoPreview.heightAnchor.constraint(equalTo: videoPreview.widthAnchor, multiplier: ratio)
		])

		NSLayoutConstraint.activate([
			quadOverlayView.topAnchor.constraint(equalTo: videoPreview.topAnchor),
			quadOverlayView.leadingAnchor.constraint(equalTo: videoPreview.leadingAnchor),
			quadOverlayView.bottomAnchor.constraint(equalTo: videoPreview.bottomAnchor),
			quadOverlayView.trailingAnchor.constraint(equalTo: videoPreview.trailingAnchor)
		])
		
		NSLayoutConstraint.activate([
			takePictureButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.Length.medium),
			takePictureButton.centerXAnchor.constraint(equalTo: centerXAnchor),
			takePictureButton.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor)
		])
		
		super.updateConstraints()
	}
}
