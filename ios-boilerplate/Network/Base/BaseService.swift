//
//  BaseService.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire
import Combine

class BaseService: BaseServiceProtocol {

    func request<T: Decodable>(with requestObject: RequestObject,
                               receiveOn queue: DispatchQueue,
                               retries: Int,
                               decoder: JSONDecoder) -> AnyPublisher<T, AdessoError> {
        Future<T, AdessoError> { [weak self] promise in
            guard let self = self else {
                Logger().log(level: .debug, message: "Unexpected Error")
                return promise(.failure(AdessoError.customError(0, "Unexpected Error")))
            }
            self.request(with: requestObject)
                .responseDecodableObject(decoder: decoder,
                                         completionHandler: { (response: AFDataResponse<T>) in
                    self.handle(with: response, promise: promise)
                })
        }
        .retry(retries)
        .receive(on: queue)
        .eraseToAnyPublisher()
    }

    private func request(with requestObject: RequestObject) -> DataRequest {
        AF.request(requestObject.url,
                   method: requestObject.method,
                   parameters: requestObject.data?.dictionary,
                   encoding: requestObject.encoding,
                   headers: requestObject.headers,
                   interceptor: requestObject.requestInterceptor)
    }

    private func handle<T>(with response: AFDataResponse<T>, promise: Future<T, AdessoError>.Promise) {
        switch response.result {
            case .failure(let error):
                handle(with: error, promise: promise, response: response.response, data: response.data)
            case .success(let value):
                promise(.success(value))
        }
    }

    private func handle<T>(with error: Error, promise: Future<T, AdessoError>.Promise, response: HTTPURLResponse?, data: Data?) {
        if let response = response, let httpStatus = response.httpStatus {
            promise(.failure(AdessoError.httpError(status: httpStatus, data: data)))
        } else {
            promise(.failure(AdessoError.unknown(error: error as NSError)))
        }
    }
}
