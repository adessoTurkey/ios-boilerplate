//
//  UIViewTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    func enlargeViewForSnapshot(maxWidth: CGFloat = 375) {
        let size = systemLayoutSizeFitting(CGSize(width: maxWidth, height: 0))
        frame = CGRect(origin: .zero, size: size)
    }

    func hasConstraintTo(_ item: AnyObject,
                         relation: NSLayoutConstraint.Relation,
                         attribute: NSLayoutConstraint.Attribute,
                         constant: CGFloat) -> Bool {

        let parent: UIView

        if let itemAsView = item as? UIView {
            if isDescendant(of: itemAsView) {
                parent = itemAsView
            } else {
                parent = self
            }
        } else if item is UILayoutGuide {
            parent = self
        } else {
            fatalError("Unexpected `item` class \(type(of: item))")
        }

        for constraint in parent.constraints {
            if ((constraint.firstItem === self && constraint.secondItem === item)
                || (constraint.firstItem === item && constraint.secondItem === self))
                && constraint.constant == constant
                && constraint.relation == relation
                && constraint.firstAttribute == attribute
                && constraint.secondAttribute == attribute {
                return true
            }
        }

        return false
    }

    func updateSizeToFitWidth(_ fittingWidth: CGFloat) {

        let size = systemLayoutSizeFitting(CGSize(width: fittingWidth, height: 0),
                                           withHorizontalFittingPriority: .required,
                                           verticalFittingPriority: .fittingSizeLevel)

        frame = CGRect(origin: .zero,
                       size: size)
    }
}
