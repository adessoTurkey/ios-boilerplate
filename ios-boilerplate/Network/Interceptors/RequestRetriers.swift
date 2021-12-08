//
//  RequestRetriers.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 8.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestRetrierProtocol {
    var build: RequestRetrier { get }
}

enum RequestRetriers: RequestRetrierProtocol {
    case example

    struct Retriers {
        static let exampleRequestRetrier = ExampleRequestRetrier()
    }

    var build: RequestRetrier {
        switch self {
            case .example:
                return Retriers.exampleRequestRetrier
        }
    }
}
