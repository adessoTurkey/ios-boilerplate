//
//  LoggingService.swift
//  ios-boilerplate
//
//  Created by Baha Ulug on 3.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

class LoggingService: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        LoggerManager.instance.setup(level: .debug)
        logApplicationAndDeviceInfo()

        return true
    }

    private func logApplicationAndDeviceInfo() {
        let version = UIApplication.appVersion
        let build = UIApplication.appBuild
        let deviceModel = UIDevice.modelName
        let osVersion = UIDevice.osVersion

        LoggerManager.instance.setInfo(version: version, build: build, deviceModel: deviceModel, osVersion: osVersion)
    }
}
