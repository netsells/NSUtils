//
//  NSUtilsDateFormatter.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation

open class NSUtilsDateFormatter: DateFormatter {
    override init() {
        super.init()
        let locale = Locale(identifier: "en_US_POSIX")
        self.locale = locale
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
