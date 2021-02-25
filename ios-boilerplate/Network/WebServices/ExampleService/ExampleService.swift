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

class ExampleService: ExampleServiceProtocol {

    private struct Constants {
        static let baseUrl = ""
    }

    private let endpointBuilder: EndpointBuilder
    private let baseService: BaseServiceProtocol

    init(baseService: BaseServiceProtocol = BaseServiceProvider.shared.baseService,
         endpointBuilder: EndpointBuilder = EndpointBuilder()) {
        self.baseService = baseService
        self.endpointBuilder = endpointBuilder
    }

    func exampleRequest() -> Single<ExampleResponse?> {
        let endpoint =  endpointBuilder.build(with: ExampleServiceEnpoint.example(firstParameter: "firstParameter",
                                                                                  secondParameter: "secondParameter"))

        return baseService.request(with: RequestObject(baseUrl: Constants.baseUrl,
                                                       endpoint: endpoint))
    }
}
