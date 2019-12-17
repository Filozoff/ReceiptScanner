//
//  ReceiptCell.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 08/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import Presentation
import UIKit

final class ReceiptCell: UICollectionViewCell, CellIdentifiable {

	// MARK: - Properties
	
	let receiptNameLabel = makeReceiptNameLabel()
	let shopNameLabel = makeShopNameLabel()

	private let stackView = makeStackView()

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.backgroundColor = .secondarySystemBackground
		contentView.addSubviewWithoutAutoresizingMask(stackView)

		stackView.addArrangedSubview(receiptNameLabel)
		stackView.addArrangedSubview(shopNameLabel)

		setNeedsUpdateConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func updateConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layout.Length.small),
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layout.Length.small),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Layout.Length.small),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Layout.Length.small)
		])
		
		super.updateConstraints()
	}
}

// MARK: - Factories

extension ReceiptCell {

	private static func makeReceiptNameLabel() -> UILabel {
		return UILabel.make {
			$0.adjustsFontForContentSizeCategory = true
			$0.font = UIFont.preferredFont(forTextStyle: .title3)
			$0.numberOfLines = 0
			$0.setContentHuggingPriority(.overDefaultLow, for: .vertical)
		}
	}

	private static func makeShopNameLabel() -> UILabel {
		return UILabel.make {
			$0.adjustsFontForContentSizeCategory = true
			$0.font = UIFont.preferredFont(forTextStyle: .body)
			$0.numberOfLines = 0
		}
	}

	private static func makeStackView() -> UIStackView {
		return UIStackView.make {
			$0.alignment = .top
			$0.axis = .vertical
		}
	}
}

// MARK: - ViewModelApplicable

extension ReceiptCell: ViewModelApplicable {

	func apply(viewModel: ReceiptCellViewModel) {
		receiptNameLabel.text = viewModel.receiptNameText
		shopNameLabel.text = viewModel.shopNameText
	}
}

// MARK: - Preview

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ReceiptCellPreview: PreviewProvider {

	private static let groceries = ReceiptCellViewModel(
		receiptNameText: "5th of December groceries",
		shopNameText: "Fresh fruits shop"
	)

	private static func makeCell(viewModel: ReceiptCellViewModel) -> ReceiptCell {
		return .make {
			$0.apply(viewModel: viewModel)
		}
	}

    static var previews: some View {
		Group {
			ForEach(ColorScheme.allCases, id: \.self) { (colorScheme) in
				UIViewPreview {
					makeCell(viewModel: groceries)
				}
					.environment(\.colorScheme, colorScheme)
					.previewDisplayName("\(colorScheme)")
					.previewLayout(.fixed(width: 375, height: 100))
			}
//			ForEach(ContentSizeCategory.allCases, id: \.self) { (contentSize) in
//				makeCell(viewModel: makeGroceriesCellViewModel())
//					.environment(\.sizeCategory, contentSize)
//					.previewDisplayName("\(contentSize)")
//					.previewLayout(.fixed(width: 375, height: 200))
//			}
		}
    }
}
#endif
