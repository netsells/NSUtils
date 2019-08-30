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

    /// Anchors a view programatically using AutoLayout constraints. Padding defaults to 0 to pin a view to its neighbouring view. translatesAutoresizingMaskIntoConstraintsesSize is set to false for the view this is called on for convience.
    ///
    /// - Parameters:
    ///   - top: top anchor
    ///   - trailing: trailing anchor
    ///   - bottom: bottom anchor
    ///   - leading: leading anchor
    ///   - padding: padding which sets the distance of which a view is pinned to another
    ///   - size: set the height or width of the view absolutely
    public func anchor(top: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    /// Helper method to deactivate constraints passed in.
    ///
    /// - Parameter constraints: layout constraints that you would like to deactivate
    func deactivateConstraints(_ constraints: NSLayoutConstraint...) {
        constraints.forEach({$0.isActive = false})
    }

    /// Add shadow layer to the view that calls this function
    /// - Parameter colour: Color of the shadow
    /// - Parameter radius: radius of the shadow from the view
    /// - Parameter offset: offset of the shadow
    /// - Parameter opacity: opacity of the shadow
    func addShadowLayer(colour: CGColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        self.layer.shadowColor = colour
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }

    func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
