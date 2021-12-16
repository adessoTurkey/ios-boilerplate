//
//  ExampleServiceRepository.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import Combine

protocol ExampleRepositoryProtocol {
    func getExample() -> AnyPublisher<ExampleResponse?, AdessoError>
}

class ExampleRepository: ExampleRepositoryProtocol {
    let exampleRemoteDataSource: ExampleRemoteDataSourceProtocol

    init(exampleRemoteDataSource: ExampleRemoteDataSourceProtocol = ExampleRemoteDataSource()) {
        self.exampleRemoteDataSource = exampleRemoteDataSource
    }

    func getExample() -> AnyPublisher<ExampleResponse?, AdessoError> {
        exampleRemoteDataSource.getExample()
    }
}
