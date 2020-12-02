//
//  RoundedButton.swift
//  Awesome Counter
//
//  Created by John Guerrero on 1/12/20.
//

import UIKit

class RoundedButton: UIButton {

    @IBInspectable var buttonFontSize: CGFloat = 17 {
        didSet {
            refreshButtonTitleFont(value: buttonFontSize)
        }
    }

    @IBInspectable var buttonCornerRadius: CGFloat = 8 {
        didSet {
            refreshCorners(value: buttonCornerRadius)
        }
    }

    @IBInspectable var buttonBorderColor: UIColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1) {
        didSet {
            refreshBorderColor(value: buttonBorderColor)
        }
    }

    @IBInspectable var buttonBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1) {
        didSet {
            refreshBackgroundColor(value: buttonBackgroundColor)
        }
    }

    @IBInspectable var buttonTintColor: UIColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1) {
        didSet {
            refreshTintColor(value: buttonTintColor)
        }
    }

    @IBInspectable var buttonDisabledColor: UIColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 0.3) {
        didSet {
            refreshDisabledTitleColor(value: buttonBorderColor)
        }
    }

    @IBInspectable var buttonTextColor: UIColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) {
        didSet {
            refreshUnselectedTitleColor(value: buttonTextColor)
        }
    }

    @IBInspectable var buttonHighlightedTextColor: UIColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1) {
        didSet {
            refreshHighlightedTitleColor(value: buttonHighlightedTextColor)
        }
    }

    override open var isEnabled: Bool {
        didSet {
            let borderColor = isEnabled ? buttonBorderColor : buttonDisabledColor
            let tintColor = isEnabled ? buttonTintColor : buttonDisabledColor
            refreshBorderColor(value: borderColor)
            refreshTintColor(value: tintColor)
            self.alpha = isEnabled ? 1.0 : 0.5
        }
    }

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? buttonBorderColor : UIColor.white
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    override func prepareForInterfaceBuilder() {
        sharedInit()
    }

    func sharedInit() {
        layer.borderWidth = 2.0
        refreshInsets()
        refreshCorners(value: buttonCornerRadius)
        refreshBorderColor(value: buttonBorderColor)
        refreshTintColor(value: buttonTextColor)
        refreshUnselectedTitleColor(value: buttonTextColor)
        refreshHighlightedTitleColor(value: buttonHighlightedTextColor)
        refreshDisabledTitleColor(value: buttonDisabledColor)
        refreshButtonTitleFont(value: buttonFontSize)
    }

    fileprivate func refreshButtonTitleFont(value: CGFloat) {
        guard let buttonTitle = self.titleLabel else {
            return
        }
        buttonTitle.font = UIFont(name: "SFProDisplay-SemiBold", size: value)
    }

    func refreshInsets() {
        self.contentEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
    }

    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }

    func refreshTintColor(value: UIColor) {
        tintColor = value
    }

    func refreshBorderColor(value: UIColor) {
        layer.borderColor = value.cgColor
    }

    func refreshUnselectedTitleColor(value: UIColor) {
        self.setTitleColor(value, for: .normal)
    }

    func refreshBackgroundColor(value: UIColor) {
        self.backgroundColor = value
    }

    func refreshHighlightedTitleColor(value: UIColor) {
        self.setTitleColor(value, for: .highlighted)
    }

    func refreshDisabledTitleColor(value: UIColor) {
        self.setTitleColor(value, for: .disabled)
    }

}
