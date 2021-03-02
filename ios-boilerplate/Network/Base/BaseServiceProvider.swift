//
//  BaseServiceProvider.swift
//  ios-boilerplate
//
//  Created by developer on 25.02.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation

class BaseServiceProvider {

    static let shared: BaseServiceProvider = BaseServiceProvider()

    let baseService: BaseServiceProtocol

    private init() {
        baseService = BaseService()
    }
}
