//
//  AdessoServiceProtocol.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 8.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire
import Combine

protocol AdessoServiceProtocol {
    associatedtype Endpoint: TargetEndpointProtocol

    var baseService: BaseServiceProtocol { get }

    func build(endpoint: Endpoint) -> String
    func build(requestAdapters: [Adapter], requestRetriers: [Retrier]) -> Interceptor
    func request<T: Decodable>(with object: RequestObject) -> AnyPublisher<T, AdessoError>
    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) -> AnyPublisher<T, AdessoError>
}

extension AdessoServiceProtocol {
    typealias Adapter = RequestAdapters
    typealias Retrier = RequestRetriers

    func build(endpoint: Endpoint) -> String {
        endpoint.path
    }

    func build(requestAdapters: [Adapter] = [], requestRetriers: [Retrier] = []) -> Interceptor {
        Interceptor(adapters: requestAdapters.map({ $0.build }),
                    retriers: requestRetriers.map({ $0.build }))
    }

    func request<T: Decodable>(with object: RequestObject) -> AnyPublisher<T, AdessoError> {
        baseService.request(with: object)
    }

    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) -> AnyPublisher<T, AdessoError> {
        var requestObject = requestObject
        return baseService.request(with: prepareAuthenticatedRequest(with: &requestObject))
    }

    private func prepareAuthenticatedRequest(with requestObject: inout RequestObject) -> RequestObject {
        var adapters = requestObject.requestInterceptor?.adapters ?? []
        adapters.append(build(requestAdapters: [.authAdapter]))
        requestObject.requestInterceptor = Interceptor(adapters: adapters,
                                                       retriers: requestObject.requestInterceptor?.retriers ?? [])
        return requestObject
    }
}
