//
//  ExampleServiceRepository.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

protocol ExampleServiceRepositoryProtocol {
    func exampleRequest() -> Single<ExampleResponse?>
}

class ExampleServiceRepository: ExampleServiceRepositoryProtocol {
    var exampleService: ExampleServiceProtocol = WebServiceProvider.shared.exampleService
    
    func exampleRequest() -> Single<ExampleResponse?> {
        exampleService.exampleRequest()
    }
}
