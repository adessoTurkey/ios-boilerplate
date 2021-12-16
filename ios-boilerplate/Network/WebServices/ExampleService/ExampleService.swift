//
//  ExampleService.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import Combine

protocol ExampleServiceProtocol {
    func exampleRequest() -> AnyPublisher<ExampleResponse?, AdessoError>
}

class ExampleService: ExampleServiceProtocol, AdessoServiceProtocol {
    typealias Endpoint = ExampleServiceEndpoint

    let baseService: BaseServiceProtocol

    init(baseService: BaseServiceProtocol = BaseServiceProvider.shared.baseService) {
        self.baseService = baseService
    }

    func exampleRequest() -> AnyPublisher<ExampleResponse?, AdessoError> {
        request(with: RequestObject(url: build(endpoint: .example(firstParameter: "firstParameter",
                                                                  secondParameter: "secondParameter"))))
    }

    func exampleAuthenticatedRequest() -> AnyPublisher<ExampleResponse?, AdessoError> {
        authenticatedRequest(with: RequestObject(url: build(endpoint: .example(firstParameter: "firstParameter",
                                                                               secondParameter: "secondParameter"))))
    }
}
