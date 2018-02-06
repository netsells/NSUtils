//
//  UIView+Extensions.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /**
     Rotate a view by specified degrees
     - parameter angle: angle in degrees
     */
    public func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * .pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
