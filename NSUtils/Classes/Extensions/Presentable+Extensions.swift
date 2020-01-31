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
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: defaultActionTitle, style: .default))

        present(alertController, animated: true, completion: nil)
    }
    
    public func showConfirmation(title: String, message: String?, actionTitle: String = "OK", cancelTitle: String = "Cancel", confirmed: @escaping ((UIAlertAction) -> Void)) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: confirmed))
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel))
        
        present(alertController, animated: true, completion: nil)
    }
}
