//
//  BaseEndpoint.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 8.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation

enum BaseEndpoint: TargetEndpointProtocol {
    case base

    var path: String {
        switch self {
            case .base:
                return Configuration.baseURL
        }
    }
}
