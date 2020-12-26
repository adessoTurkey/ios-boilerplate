//
//  ExampleURLBuilder.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

class EndpointBuilder {

    init() { }

    func build<T: TargetEndpointProtocol>(with targetEndpoint: T) -> String {
        targetEndpoint.path
    }
}
