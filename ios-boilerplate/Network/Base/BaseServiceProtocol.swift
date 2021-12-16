//
//  BaseServiceProtocol.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 16.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Combine

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               receiveOn queue: DispatchQueue,
                               retries: Int,
                               decoder: JSONDecoder) -> AnyPublisher<T, AdessoError>
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               receiveOn queue: DispatchQueue = .main,
                               retries: Int = 1,
                               decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, AdessoError> {
        request(with: requestObject,
                receiveOn: queue,
                retries: retries,
                decoder: decoder)
    }
}
