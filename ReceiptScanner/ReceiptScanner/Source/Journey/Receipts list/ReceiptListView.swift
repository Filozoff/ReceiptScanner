//
//  ReceiptListView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 21/11/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import KWFoundation
import UIKit

class ReceiptListView: UIView {

	let titleLabel = makeTitleLabel()
	let firstHeader = UILabel {
		$0.adjustsFontForContentSizeCategory = true
		$0.text = ""
	}
	
	let secondaryHeader: UILabel = build {
		$0.textColor = .red
		$0.font = UIFont.systemFont(ofSize: 10)
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupView()

		addSubviewWithoutAutoresizingMask(titleLabel)
		addSubviewWithoutAutoresizingMask(firstHeader)
		addSubviewWithoutAutoresizingMask(secondaryHeader)

		setNeedsUpdateConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupView() {
		backgroundColor = .systemBackground
	}

	override func updateConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			titleLabel.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor)
		])

		NSLayoutConstraint.activate([
			firstHeader.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2.0),
			firstHeader.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			firstHeader.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor)
		])

		NSLayoutConstraint.activate([
			secondaryHeader.topAnchor.constraint(equalToSystemSpacingBelow: firstHeader.bottomAnchor, multiplier: 1.0),
			secondaryHeader.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			secondaryHeader.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor)
		])

		super.updateConstraints()
	}
}

extension ReceiptListView {

	private static func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.adjustsFontForContentSizeCategory = true
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		label.numberOfLines = 0
		return label
	}
}

extension UILabel {

	convenience init(closure: ValueClosure<UILabel>) {
		self.init()
		closure(self)
	}
}

func build<T>(closure: (T) -> Void) -> T where T: UIView {
	let view = T()
	closure(view)
	return view
}
