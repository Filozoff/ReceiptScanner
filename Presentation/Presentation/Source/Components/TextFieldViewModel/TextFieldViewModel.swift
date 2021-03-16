//
//  TextFieldViewModel.swift
//  Presentation
//
//  Created by Filo on 16/03/2021.
//  Copyright © 2021 Kamil Wyszomierski. All rights reserved.
//

import Foundation

public class TextFieldViewModel {

	let inputPolicy: KeyInputPolicy

	init(inputPolicy: KeyInputPolicy) {
		self.inputPolicy = inputPolicy
	}
}

// MARK: - Interactions

extension TextFieldViewModel {

	func shouldChange(_ replacementString: String, in string: String, at range: NSRange) -> Bool {
		guard let range = Range(range, in: string) else { return false }
		let computedString = string.replacingCharacters(in: range, with: replacementString)
		return inputPolicy.predicate(computedString)
	}
}
