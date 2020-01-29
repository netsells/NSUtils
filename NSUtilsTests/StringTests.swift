//
//  StringTests.swift
//  NSUtilsTests
//
//  Created by Luke Sadler on 29/01/2020.
//  Copyright © 2020 Netsells. All rights reserved.
//

import XCTest
@testable import NSUtils

class StringTests: XCTestCase {

    func test_string_from_base64_basic () throws {
        
        let base64 = "VGhpcyBpcyBhIHRlc3Q="
        let possibleString = base64.base64Decoded
        
        let unwrapped = try XCTUnwrap(possibleString)
        
        XCTAssertEqual(unwrapped, "This is a test")
    }
    
    func test_string_from_base64_emoji () throws {
        
        let base64 = "VGhpcyBpcyBhIHRlc3Qg8J+kt+KAjeKZgu+4jw=="
        let possibleString = base64.base64Decoded
        
        let unwrapped = try XCTUnwrap(possibleString)
        
        XCTAssertEqual(unwrapped, "This is a test 🤷‍♂️")
    }
    
    func test_string_from_base64_glyph () throws {
          
          let base64 = "44GT44KM44Gv44OG44K544OI44Gn44GZ"
          let possibleString = base64.base64Decoded
          
          let unwrapped = try XCTUnwrap(possibleString)
          
          XCTAssertEqual(unwrapped, "これはテストです")
      }
    
    func test_string_to_base64_basic () {
        
        let string = "This is a test"
        let base64 = string.base64Encoded
        
        XCTAssertEqual(base64, "VGhpcyBpcyBhIHRlc3Q=")
    }
    
    func test_string_to_base64_emojis () {
                
        let string = "💥 This is a test 💥"
        let base64 = string.base64Encoded
        
        XCTAssertEqual(base64, "8J+SpSBUaGlzIGlzIGEgdGVzdCDwn5Kl")
    }

}
