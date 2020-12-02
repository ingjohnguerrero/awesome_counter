//
//  String+localization.swift
//  Awesome Counter
//
//  Created by John Guerrero on 30/11/20.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(_ arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
