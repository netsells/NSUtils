//
//  ProgressBarView.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation
import UIKit

open class ProgressBarView: UIView {

    @IBInspectable var startColour: UIColor = UIColor.white
    @IBInspectable var endColour: UIColor = UIColor.blue
    @IBInspectable var completionPercentage: CGFloat = 0.0

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()
        let colours: [CGColor] = [startColour.cgColor, endColour.cgColor]

        // Should almost always be RGB - We don't really want to use CMYK
        let colourSpace = CGColorSpaceCreateDeviceRGB()

        let colourLocations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: colourSpace, colors: colours as CFArray, locations: colourLocations)

        let startPoint = CGPoint(x: 0, y: self.frame.height)
        let endPoint = CGPoint(x: self.frame.width * completionPercentage, y: self.frame.height)

        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }
}
