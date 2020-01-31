//
//  String+Extensions.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation

extension String {
    public func trunc(length: Int, trailing: String? = "") -> String {
        if self.count > length {
            let start = self.index(self.startIndex, offsetBy: 0)
            let end = self.index(self.startIndex, offsetBy: length)
            let range = start..<end
            return "\(String(self[range]))\(trailing ?? "")"
        } else {
            return self
        }
    }

    public var base64Decoded: String? {
        guard let data = Data(base64Encoded: self, options: NSData.Base64DecodingOptions(rawValue: 0)) else { return nil }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    public var base64Encoded: String {
        let data = self.data(using: String.Encoding.utf8)
        return data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }

    public func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
