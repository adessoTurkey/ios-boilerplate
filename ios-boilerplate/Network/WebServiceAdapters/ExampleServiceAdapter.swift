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
    func exampleRequest(onSuccess: @escaping (ExampleUIModel?) -> Void,
                        onError: @escaping (AdessoError) -> Void) -> Disposable?
}

class ExampleServiceAdapter: ExampleServiceAdapterProtocol {
    var service: ExampleServiceProtocol = ExampleService()

    func exampleRequest(onSuccess: @escaping (ExampleUIModel?) -> Void,
                        onError: @escaping (AdessoError) -> Void) -> Disposable? {
        service.exampleRequest().map(to: { (response: ExampleResponse?) -> (ExampleUIModel?) in
            ExampleUIModelConverter.convert(with: response)
        }, onSuccess: onSuccess, onError: onError)
    }
}
