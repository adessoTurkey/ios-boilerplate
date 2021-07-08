//
//  UIAlertActionTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIAlertAction {

    private typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

    func execHandler() {

        if let block = self.value(forKey: "handler") {
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let handler = unsafeBitCast(blockPtr, to: AlertHandler.self)
            handler(self)
        }
    }
}
