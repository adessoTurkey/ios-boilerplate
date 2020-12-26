//
//  PrimitiveSequenceTypeExtensions.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift

extension PrimitiveSequenceType where Trait == SingleTrait {
    func map<T: Decodable, U>(to converter: @escaping (T) -> (U?),
                              onSuccess: @escaping (U) -> Void,
                              onError: ((AdessoError) -> Void)? = nil) -> Disposable? {
        subscribe(onSuccess: { response in
            guard let response = response as? T,
                  let result = converter(response) else {
                onError?(AdessoError.mappingFailed)
                return
            }
            onSuccess(result)
        }, onError: { (error: Error) in
            if let adessoError = error as? AdessoError {
                onError?(adessoError)
            }
        })
    }
}
