//
//  Presentable+Extensions.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation

public protocol Presentable {}

extension UIViewController {
    public func showSystemAlert(title: String, message: String, defaultActionTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: defaultActionTitle, style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
        }

        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }
}
