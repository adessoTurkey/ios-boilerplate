//
//  SwifterManager.swift
//  ios-boilerplate
//
//  Created by Baha Ulug on 1.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
#if canImport(Swifter)
import Swifter
#endif

class SwifterManager {

    private enum Constants {
        static let sampleData: String = "sample-data"
        static let fileType: String = "json"
        static let port: UInt16 = 9081
    }

    static let instance = SwifterManager()
    #if canImport(Swifter)
    var swifterServer: HttpServer?
    #endif

    // MARK: Swifter
    // swiftlint:disable all
    func startSwifterServer() {
        #if canImport(Swifter)
        swifterServer = HttpServer()
        if let swifterServer {
            swifterServer["/hello"] = { .ok(.htmlBody("You asked for \($0)")) }
            guard let path = Bundle.main.path(forResource: Constants.sampleData, ofType: Constants.fileType ) else { return }
            swifterServer["/sample"] = shareFile(path)
            
            swifterServer.POST["/sample"] = { r in
                return .ok(.text("Hello from POST : " + (r.params["id"] ?? "no parameter named id") ))
            }
            do {
                try swifterServer.start(Constants.port)
            } catch let error {
                print(error)
            }
        }
        #endif
    }
    // swiftlint:enable all

    func stopSwifterServer() {
        #if canImport(Swifter)
        if let swifterServer {
            swifterServer.stop()
        }
        #endif
    }
}
