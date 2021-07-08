//
//  UIColorComparisonTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    func isEqualWithConversion(_ color: UIColor) -> Bool {
        guard let space = self.cgColor.colorSpace
            else { return false }
        guard let converted = color.cgColor.converted(to: space, intent: .defaultIntent, options: nil)
            else { return false }
        return self.cgColor == converted
    }
}
