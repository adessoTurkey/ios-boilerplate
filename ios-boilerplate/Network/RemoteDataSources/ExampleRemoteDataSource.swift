//
//  ExampleRemoteDataSource.swift
//  ios-boilerplate
//
//  Created by Cagri Gider on 2.03.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Combine

protocol ExampleRemoteDataSourceProtocol {
    func getExample() -> AnyPublisher<ExampleResponse?, AdessoError>
}

class ExampleRemoteDataSource: ExampleRemoteDataSourceProtocol {
    let exampleService: ExampleServiceProtocol

    init(exampleService: ExampleServiceProtocol = WebServiceProvider.shared.exampleService) {
        self.exampleService = exampleService
    }

    func getExample() -> AnyPublisher<ExampleResponse?, AdessoError> {
        exampleService.exampleRequest()
    }
}
