//
//  ExampleRemoteDataSource.swift
//  ios-boilerplate
//
//  Created by Cagri Gider on 2.03.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

class ExampleRemoteDataSource {
    var exampleService: ExampleServiceProtocol = WebServiceProvider.shared.exampleService

    func getExample() -> Single<ExampleResponse?> {
        exampleService.exampleRequest()
    }
}
