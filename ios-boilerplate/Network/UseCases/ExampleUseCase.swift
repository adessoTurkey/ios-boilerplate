//
//  ExampleServiceAdapter.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import Combine

protocol ExampleUseCaseProtocol {
    func fetchExample() -> AnyPublisher<ExampleResponse?, AdessoError>
}

class ExampleUseCase: ExampleUseCaseProtocol {
    let exampleRepository: ExampleRepositoryProtocol

    init(exampleRepository: ExampleRepositoryProtocol = ExampleRepository()) {
        self.exampleRepository = exampleRepository
    }

    func fetchExample() -> AnyPublisher<ExampleResponse?, AdessoError> {
        exampleRepository.getExample()
    }
}
