//
//  ExampleServiceAdapter.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleServiceAdapterProtocol {
    func fetchExample() -> Single<ExampleResponse?>
}

class ExampleServiceRepository: ExampleServiceAdapterProtocol {
    let exampleRepository: ExampleRepository = ExampleRepository()

    func fetchExample() -> Single<ExampleResponse?> {
        exampleRepository.getExample()
    }
}
