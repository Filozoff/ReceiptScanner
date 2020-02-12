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

	// MARK: - Updates

	override func layoutSubviews() {
		super.layoutSubviews()

		collectionView.collectionViewLayout.invalidateLayout()
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

// MARK: - Setups

extension ReceiptListView {

	private func setupAddButton() {
		addButton.apply(style: .add)
	}

	private func setupCollectionView() {
		collectionView.alwaysBounceVertical = true
		collectionView.backgroundColor = .systemBackground
	}

	private func setupView() {
		backgroundColor = .systemBackground
	}
}

// MARK: - Factories

extension ReceiptListView {

	private static func makeLayout() -> UICollectionViewCompositionalLayout {
		return UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
			let size = NSCollectionLayoutSize(
				widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
				heightDimension: NSCollectionLayoutDimension.estimated(344)
			)
			let item = NSCollectionLayoutItem(layoutSize: size)
			let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

			let section = NSCollectionLayoutSection(group: group)
			section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
			section.interGroupSpacing = 10

			return section
		}
	}
}
