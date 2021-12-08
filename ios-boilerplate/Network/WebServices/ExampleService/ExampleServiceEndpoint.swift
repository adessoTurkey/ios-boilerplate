//
//  ExampleServiceEndpoint.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

enum ExampleServiceEndpoint: TargetEndpointProtocol {
    case example(firstParameter: String, secondParameter: String)

    private struct Constants {
        static let exampleEndpoint = "exampleEndpoint/%@/%@"
    }

    var path: String {
        switch self {
            case .example(let firstParameter, let secondParameter):
                return BaseEndpoint.base.path + String(format: Constants.exampleEndpoint, firstParameter, secondParameter)
        }
    }
}
