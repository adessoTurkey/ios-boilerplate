//
//  UIDeviceExtension.swift
//  ios-boilerplate
//
//  Created by Baha Ulug on 3.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIDevice {

    static let osVersion: String = {
        UIDevice.current.systemVersion
    }()

    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        // swiftlint:disable:next cyclomatic_complexity function_body_length
        func mapToDevice(identifier: String) -> String {
            switch identifier {
              case "iPhone6,1", "iPhone6,2":
                return "iPhone 5s"
              case "iPhone7,2":
                return "iPhone 6"
              case "iPhone7,1":
                return "iPhone 6 Plus"
              case "iPhone8,1":
                return "iPhone 6s"
              case "iPhone8,2":
                return "iPhone 6s Plus"
              case "iPhone8,4":
                return "iPhone SE"
              case "iPhone9,1", "iPhone9,3":
                return "iPhone 7"
              case "iPhone9,2", "iPhone9,4":
                return "iPhone 7 Plus"
              case "iPhone10,1", "iPhone10,4":
                return "iPhone 8"
              case "iPhone10,2", "iPhone10,5":
                return "iPhone 8 Plus"
              case "iPhone10,3", "iPhone10,6":
                return "iPhone X"
              case "iPhone11,2":
                return "iPhone XS"
              case "iPhone11,4", "iPhone11,6":
                return "iPhone XS Max"
              case "iPhone11,8":
                return "iPhone XR"
              case "iPhone12,1":
                return "iPhone 11"
              case "iPhone12,3":
                return "iPhone 11 Pro"
              case "iPhone12,5":
                return "iPhone 11 Pro Max"
              case "iPhone12,8":
                return "iPhone SE (2nd generation)"
              case "iPad4,1", "iPad4,2", "iPad4,3":
                return "iPad Air"
              case "iPad5,3", "iPad5,4":
                return "iPad Air 2"
              case "iPad11,4", "iPad11,5":
                return "iPad Air (3rd generation)"
              case "iPad4,4", "iPad4,5", "iPad4,6":
                return "iPad mini 2"
              case "iPad4,7", "iPad4,8", "iPad4,9":
                return "iPad mini 3"
              case "iPad5,1", "iPad5,2":
                return "iPad mini 4"
              case "iPad11,1", "iPad11,2":
                return "iPad mini (5th generation)"
              case "iPad6,3", "iPad6,4":
                return "iPad Pro (9.7-inch)"
              case "iPad7,3", "iPad7,4":
                return "iPad Pro (10.5-inch)"
              case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
                return "iPad Pro (11-inch) (1st generation)"
              case "iPad8,9", "iPad8,10":
                return "iPad Pro (11-inch) (2nd generation)"
              case "iPad6,7", "iPad6,8":
                return "iPad Pro (12.9-inch) (1st generation)"
              case "iPad7,1", "iPad7,2":
                return "iPad Pro (12.9-inch) (2nd generation)"
              case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
                return "iPad Pro (12.9-inch) (3rd generation)"
              case "iPad8,11", "iPad8,12":
                return "iPad Pro (12.9-inch) (4th generation)"
              case "i386", "x86_64":
                return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
              default:
                return identifier
            }
        }

        return mapToDevice(identifier: identifier)
    }()
}
