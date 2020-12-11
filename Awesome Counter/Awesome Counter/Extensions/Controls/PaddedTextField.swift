//
//  PaddedTextField.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation
import UIKit

class PaddedTextField : UITextField {

  let padding = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
