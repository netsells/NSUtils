//
//  FileStorageTests.swift
//  NSUtilsTests
//
//  Created by Luke Sadler on 29/01/2020.
//  Copyright © 2020 Netsells. All rights reserved.
//

import XCTest
@testable import NSUtils

class FileStorageTests: XCTestCase {

    override class func setUp() {
        super.setUp()
        
        let defaultSavePath = FileManager.default.defaultSavePath
        let contents = try? FileManager.default.contentsOfDirectory(atPath: defaultSavePath.path)
        
        contents?.forEach({
            try? FileManager.default.removeItem(atPath: $0)
        })
        
    }
    
    var testData: Data {
        Data(base64Encoded: "VGhpcyBpcyBhIHRlc3Q=")!
    }
    
    func test_file_save () {
        
        let path = FileManager.default.saveData(testData, name: "Test")
        XCTAssertNotNil(path)
    }
    
    func test_file_save_failed () {
        let path = FileManager.default.saveData(testData, name: "Test/Test")
        XCTAssertNil(path)
    }
    
    func test_file_load_fail () {
        
        let loadedData = FileManager.default.loadData(fromName: "blah")
        XCTAssertNil(loadedData.data)
    }
    
    func test_file_load_succeed () throws {
        
        let savePath = FileManager.default.saveData(testData, name: "Testing")
        
        XCTAssertNotNil(savePath)
        
        let loadedData = FileManager.default.loadData(fromName: "Testing")
        
        XCTAssertNotNil(loadedData)
        
        let data = try XCTUnwrap(loadedData.data)
        
        let string = String(data: data, encoding: .utf8)
        
        XCTAssertEqual(string, "This is a test")
        
    }
    
    func test_file_delete_from_name_success () {
        
        let savePath = FileManager.default.saveData(testData, name: "Testing")
        
        XCTAssertNotNil(savePath)
        
        let success = FileManager.default.removeFileFromDisk(fileName: "Testing")
        
        XCTAssertTrue(success)
    }
    
    func test_file_delete_from_path_success () throws {
        
        let savePath = FileManager.default.saveData(testData, name: "Testing")
        
        let unwrappedPath = try XCTUnwrap(savePath)
        
        let success = FileManager.default.removeFileFromDisk(path: unwrappedPath)
        
        XCTAssertTrue(success)
    }
    
    func test_file_delete_from_path_failure () {
        
        let success = FileManager.default.removeFileFromDisk(path: URL(fileURLWithPath: "blah"))
        
        XCTAssertFalse(success)
    }
    
}
