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
    func exampleRequest() -> Single<ExampleResponse?>
}

class ExampleServiceRepository: ExampleServiceAdapterProtocol {
    var service: ExampleServiceProtocol = ExampleService()
    
    func exampleRequest() -> Single<ExampleResponse?> {
        service.exampleRequest()
    }
}
