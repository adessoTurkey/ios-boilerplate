//
//  UIViewController+NavigationItemTapTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit
import XCTest

extension UIViewController {

    /// assuming the back button is the left bar item
    func simulateBackBarItemTap() {
        simulateLeftBarItemTap(debugIdentifier: "BackBarItem")
    }

    /// assuming the close button is the right bar item
    func simulateCloseBarItemTap() {
        simulateRightBarItemTap(debugIdentifier: "CloseBarItem")
    }

    func simulateLeftBarItemTap(debugIdentifier: String? = nil) {
        simulateTap(on: navigationItem.leftBarButtonItem, debugIdentifier: debugIdentifier ?? "LeftBarItem")
    }

    func simulateRightBarItemTap(debugIdentifier: String? = nil) {
        simulateTap(on: navigationItem.rightBarButtonItem, debugIdentifier: debugIdentifier ?? "RightBarItem")
    }

    func simulateTap(on barButtonItem: UIBarButtonItem?, debugIdentifier: String? = nil) {
        guard let barButtonItem = barButtonItem else {
            XCTFail("BarButtomItem is nil, cannot tap \(debugIdentifier ?? "it")")
            return
        }

        guard let target = barButtonItem.target else {
            XCTFail("Missing target on \(debugIdentifier ?? "BarButtomItem")")
            return
        }

        guard let action = barButtonItem.action else {
            XCTFail("Missing action on \(debugIdentifier ?? "BarButtomItem")")
            return
        }

        UIApplication.shared.sendAction(action, to: target, from: nil, for: nil)
    }
}
