//
//  Array+Extensions.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    /// Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
    
    /// Remove all instances of collection element that is equal to the given `object`:
    mutating func removeAllInstances(of object: Element) {
        removeAll(where: { $0 == object})
    }
    
}
