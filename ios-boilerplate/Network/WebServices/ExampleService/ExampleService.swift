//
//  ExampleService.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleServiceProtocol {
    func exampleRequest() -> Single<ExampleResponse?>
}

class ExampleService: BaseService, ExampleServiceProtocol {

    private struct Constants {
        static let baseUrl = ""
    }

    private let endpointBuilder: EndpointBuilder

    init() {
        endpointBuilder = EndpointBuilder()
        super.init()
    }

    func exampleRequest() -> Single<ExampleResponse?> {
        let endpoint =  endpointBuilder.build(with: ExampleServiceEnpoint.example(firstParameter: "firstParameter",
                                                                                  secondParameter: "secondParameter"))

        return request(with: RequestObject(baseUrl: Constants.baseUrl,
                                           endpoint: endpoint))
    }
}
