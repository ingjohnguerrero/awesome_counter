//
//  UIKit+XIBLocalizable.swift
//  Awesome Counter
//
//  Created by John Guerrero on 1/12/20.
//

import Foundation
import UIKit

// MARK: XIBLocalizable
public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
