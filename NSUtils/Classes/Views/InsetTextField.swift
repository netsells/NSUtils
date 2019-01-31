//
//  InsetTextField.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import UIKit

@IBDesignable open class InsetTextField: UITextField {

    @IBInspectable var top: CGFloat = 0
    @IBInspectable var left: CGFloat = 8
    @IBInspectable var right: CGFloat = 8
    @IBInspectable var bottom: CGFloat = 0

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }
}
