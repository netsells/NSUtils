//
//  FileManager+Extentions.swift
//  NSUtils
//
//  Created by Thomas Murray on 30/08/2019.
//  Copyright © 2019 Netsells. All rights reserved.
//

import Foundation

//Global variable to access directory url
let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

///Helper func to get the directory url on device.
func getDocumentsDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
}

extension FileManager {
    /// creates and returns a url filepath with image name
    ///
    /// - Parameter url: url in which to create path
    /// - Returns: returned url with image name
    func localFileUrl(for url: URL) -> URL {
        return filePath.appendingPathComponent(url.lastPathComponent)
    }

    /// removes the image from the local device storage
    ///
    /// - Parameters:
    ///   - url: url in which to find the image to remove
    ///   - closure: return bool to determine if success or not
    func removeFileFromDisk(from url: String, closure: @escaping (Bool) -> ()) {
        do {
            let manager = FileManager.default
            let path = try manager.contentsOfDirectory(at: filePath, includingPropertiesForKeys: [], options: .skipsHiddenFiles)
            let image = manager.localFileUrl(for: URL(string: url)!)
            for item in path {
                if item.absoluteString == image.absoluteString {
                    do {
                        try manager.removeItem(at: item)
                    } catch {
                        closure(false)
                    }
                }
            }
        } catch {
            closure(false)
        }
    }
}



