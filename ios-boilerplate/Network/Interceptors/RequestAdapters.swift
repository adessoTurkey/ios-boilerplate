//
//  RequestAdapters.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 8.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestAdapterProtocol {
    var build: RequestAdapter { get }
}

enum RequestAdapters: RequestAdapterProtocol {
    case authAdapter

    struct Adapters {
        static let authAdapter = ExampleRequestAdapter()
    }

    var build: RequestAdapter {
        switch self {
            case .authAdapter:
                return Adapters.authAdapter
        }
    }
}
