//
//  Layout.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import UIKit

struct Layout {
	
	private init() { }
}

extension Layout {
	
	struct Length {
		
		/// 64.0
		static let extraExtraExtraLarge: CGFloat = 64.0
		/// 48.0
		static let extraExtraLarge: CGFloat = 48.0
		/// 32.0
		static let extraLarge: CGFloat = 32.0
		/// 24.0
		static let large: CGFloat = 24.0
		/// 16.0
		static let medium: CGFloat = 16.0
		/// 8.0
		static let small: CGFloat = 8.0
		/// 4.0
		static let extraSmall: CGFloat = 4.0
		/// 2.0
		static let extraExtraSmall: CGFloat = 2.0
		/// 1.0
		static let one: CGFloat = 1.0
		
		static let hair: CGFloat = Length.one / UIScreen.main.scale
		
		private init() { }
	}
}
