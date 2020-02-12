//
//  UICollectionViewExtension.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 10/12/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

extension UICollectionView {

	func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UICollectionViewCell & CellIdentifiable {
		guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
			fatalError("Cannot find registered cell class for identifier \"\(T.reuseIdentifier)\"")
		}

		return cell
	}

	func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell & CellIdentifiable {
		register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
	}
}
