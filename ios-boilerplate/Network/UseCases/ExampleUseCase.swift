//
//  ExampleServiceAdapter.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleUseCaseProtocol {
    func fetchExample() -> Single<ExampleResponse?>
}

class ExampleUseCase: ExampleUseCaseProtocol {
    let exampleRepository: ExampleRepositoryProtocol

    init(exampleRepository: ExampleRepositoryProtocol = ExampleRepository()) {
        self.exampleRepository = exampleRepository
    }

    func fetchExample() -> Single<ExampleResponse?> {
        exampleRepository.getExample()
    }
}
