//
//  SwifterServerService.swift
//  ios-boilerplate
//
//  Created by Baha Ulug on 1.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit
#if canImport(Swifter)
import Swifter
#endif


class  SwifterServerService: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if canImport(Swifter)
        SwifterManager.instance.startSwifterServer()
        #endif
        return true
    }
}
