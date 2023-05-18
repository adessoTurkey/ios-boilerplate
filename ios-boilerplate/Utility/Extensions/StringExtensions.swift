//
//  StringExtensions.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        NSLocalizedString(self, comment: "") // swiftlint:disable:this nslocalizedstring_key
    }

    static var empty: Self {
        ""
    }
}
