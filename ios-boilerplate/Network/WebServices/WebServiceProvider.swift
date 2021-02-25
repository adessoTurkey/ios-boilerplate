//
//  WebServiceProvider.swift
//  ios-boilerplate
//
//  Created by developer on 25.02.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation

class WebServiceProvider {
    static let shared: WebServiceProvider = WebServiceProvider()

    let exampleService: ExampleServiceProtocol

    private init() {
        exampleService = ExampleService()
    }
}
