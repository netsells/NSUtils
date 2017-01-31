//
//  Alerts.swift
//  Pods
//
//  Created by Jack Colley on 31/01/2017.
//
//

import Foundation

public protocol Presentable {}

extension Presentable {
    public func showSystemAlert(title: String, message: String, defaultActionTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: defaultActionTitle, style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(okAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
