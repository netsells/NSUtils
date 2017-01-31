//
//  Array.swift
//  Pods
//
//  Created by Jack Colley on 31/01/2017.
//
//

import Foundation

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
