//
//  FileManager+Extentions.swift
//  NSUtils
//
//  Created by Thomas Murray on 30/08/2019.
//  Copyright © 2019 Netsells. All rights reserved.
//

import Foundation

enum FileErrors: Error {
    case defaultDirectoryDoesNotExist
}


extension FileManager {
    
    var defaultSavePath: URL {
        urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("SavedDocuments")
    }
    
    var savePathExists: Bool {
        fileExists(atPath: defaultSavePath.path)
    }
    
    // If we're saving to directory, just make sure it exists
    private func ensureSaveDirectoryExists () throws {
        let savePath = defaultSavePath.path
        
        if !fileExists(atPath: savePath) {
            try createDirectory(atPath: savePath, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    /// The directory url on device.
    var documentsDirectory: URL {
        urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    /// creates and returns a url filepath with image name
    ///
    /// - Parameter url: url in which to create path
    /// - Returns: returned url with image name
    private func localFileUrl(for name: String) -> URL {
        return defaultSavePath.appendingPathComponent(name)
    }
    
    /// removes the image from the local device storage
    ///
    /// - Parameters:
    ///   - filename: name of the file that you want to delete
    /// - Returns: returns false if there was an error, not including when the file does not exist
    @discardableResult
    func removeFileFromDisk(fileName name: String) -> Bool {
        
        do {
            guard savePathExists else { throw FileErrors.defaultDirectoryDoesNotExist }
            let filePath = localFileUrl(for: name)
            try removeItem(at: filePath)
            return true
        } catch let error {
            print("Error deleting file (\(name)):: \n\(error)")
            return false
        }
    }
    
    /// removes the image from the local device storage
    ///
    /// - Parameters:
    ///   - path: This is the absolute url of the file
    /// - Returns: success flag on removing file from url path
    @discardableResult
    func removeFileFromDisk(path: URL) -> Bool {
        do {
            try removeItem(at: path)
            return true
        } catch let error {
            print("Error deleting file with path (\(path)):: \n\(error)")
            return false
        }
    }
    
    /// Saves data with filename
    /// - Parameters:
    ///  - data: data object that you want saving to documents directory
    ///  - name: name of the file that you want to store
    /// - Returns: URL of the new file
    @discardableResult
    func saveData(_ data: Data, name: String) -> URL? {
        
        do{
            try ensureSaveDirectoryExists()
            let localPath = localFileUrl(for: name)
            try data.write(to: localPath, options: .atomicWrite)
            return localPath
        } catch let error {
            print("error saving::: \(error.localizedDescription)")
            return nil
        }
    }
    
    typealias LoadedData = (data: Data?, path: URL?)
    
    /// Load data from filename
    /// - Parameters:
    ///  - name: name of the file that you want to store
    /// - Returns: Data and URL of the new file
    func loadData(fromName name: String) -> LoadedData {
        
        do{
            
            guard savePathExists else { throw FileErrors.defaultDirectoryDoesNotExist }
            let filePath = localFileUrl(for: name)
            let data = contents(atPath: filePath.path)
            return (data, filePath)
            
        } catch let error {
            print("error loading::: \(error.localizedDescription)")
            return (nil, nil)
        }
    }

}



