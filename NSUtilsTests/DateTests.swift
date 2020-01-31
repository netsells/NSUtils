//
//  DateTests.swift
//  NSUtilsTests
//
//  Created by Luke Sadler on 29/01/2020.
//  Copyright © 2020 Netsells. All rights reserved.
//

import XCTest
@testable import NSUtils

class DateTests: XCTestCase {

    func test_format_for_time () {
        
        let date = Date.distantPast
        XCTAssertEqual(date.formatForTime(is12HourTime: true), "11:58 PM")
        XCTAssertEqual(date.formatForTime(is12HourTime: false), "23:58")
        XCTAssertEqual(date.formatForTime(), "23:58")
    }
    
    func test_format_for_date () {
        XCTAssertEqual(Date.distantPast.formatForDate(), "31/12/0001")
    }
    
    func test_format_for_timestamp () {
        XCTAssertEqual(Date.distantPast.formatForTimestamp(), "0001-12-31 23:58:45")
    }

}
