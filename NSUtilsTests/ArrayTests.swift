//
//  ArrayTests.swift
//  NSUtilsTests
//
//  Created by Luke Sadler on 29/01/2020.
//  Copyright © 2020 Netsells. All rights reserved.
//

import XCTest
@testable import NSUtils

class ArrayTests: XCTestCase {
    
    func test_remove_item_from_array () {
     
        let string1 = "this is string 1"
        let string2 = "this is string 2"
        let string3 = "this is string 3"
        
        var strings = [string1, string2, string3]
        
        XCTAssertTrue(strings.contains(string2))
        
        strings.remove(object: string2)
        
        XCTAssertFalse(strings.contains(string2))
    }
    
    func test_remove_all_instances_from_array () {
     
        let string1 = "this is string 1"
        let string2 = "this is string 2"
        let string3 = "this is string 3"
        
        var strings = [string1, string2, string3, string2]
        
        XCTAssertTrue(strings.contains(string2))
        
        strings.removeAllInstances(of: string2)
        
        XCTAssertFalse(strings.contains(string2))
    }

}
