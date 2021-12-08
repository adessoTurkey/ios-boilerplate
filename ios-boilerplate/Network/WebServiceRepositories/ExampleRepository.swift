//
//  ExampleServiceRepository.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleRepositoryProtocol {
    func getExample() -> Single<ExampleResponse?>
}

class ExampleRepository: ExampleRepositoryProtocol {
    let exampleRemoteDataSource: ExampleRemoteDataSourceProtocol

    init(exampleRemoteDataSource: ExampleRemoteDataSourceProtocol = ExampleRemoteDataSource()) {
        self.exampleRemoteDataSource = exampleRemoteDataSource
    }

    func getExample() -> Single<ExampleResponse?> {
        exampleRemoteDataSource.getExample()
    }
}
