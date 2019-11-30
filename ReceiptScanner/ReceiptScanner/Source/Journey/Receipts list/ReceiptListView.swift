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

	let addButton = CircleButton(type: .system)
	let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupView()

		setupCollectionView()
		addSubviewWithoutAutoresizingMask(collectionView)

		setupAddButton()
		addSubviewWithoutAutoresizingMask(addButton)

		setNeedsUpdateConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func updateConstraints() {
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])

		NSLayoutConstraint.activate([
			addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.Length.medium),
			addButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
		])

		super.updateConstraints()
	}
}

extension ReceiptListView {

	private func setupAddButton() {
		addButton.apply(style: .add)
	}

	private func setupCollectionView() {
		collectionView.alwaysBounceVertical = true
		collectionView.backgroundColor = .systemBackground
	}

	static func makeLayout() -> UICollectionViewCompositionalLayout {
		return UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
			let spacing: CGFloat = 16.0
			let partialSpacing = spacing / 2.0
			let edgeInsets = NSDirectionalEdgeInsets(
				top: partialSpacing,
				leading: partialSpacing,
				bottom: partialSpacing,
				trailing: partialSpacing
			)

			let height: CGFloat = 100
			let itemSize = NSCollectionLayoutSize(
				widthDimension: .fractionalWidth(1.0),
				heightDimension: .absolute(height)
			)

			let item = NSCollectionLayoutItem(layoutSize: itemSize)
			item.contentInsets = edgeInsets
			let groupSize = NSCollectionLayoutSize(
				widthDimension: .fractionalWidth(1.0),
				heightDimension: .estimated(height)
			)

			let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
			let section = NSCollectionLayoutSection(group: group)
			section.contentInsets = edgeInsets
			return section
		}
	}

	private func setupView() {
		backgroundColor = .systemBackground
	}
}
