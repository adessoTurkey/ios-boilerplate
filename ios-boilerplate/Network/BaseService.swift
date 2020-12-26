//
//  BaseService.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import RxSwift
import CodableAlamofire
import Alamofire

protocol BaseServiceProtocol {
    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) -> Single<T>
    func request<T: Decodable>(with requestObject: RequestObject) -> Single<T>
}

public class BaseService: BaseServiceProtocol {

    private let disposeBag = DisposeBag()
    private let headerBuilder: HeaderBuilderProtocol

    init(headerBuilder: HeaderBuilderProtocol = HeaderBuilder()) {
        self.headerBuilder = headerBuilder
    }

    @discardableResult
    func request<T: Decodable>(with requestObject: RequestObject) -> Single<T> {
        requestObject.headers = createHeaders(with: requestObject.headers ?? [:])
        return Observable<T>.create { [weak self] observer in
            guard let self = self else {
                observer.onCompleted()
                return Disposables.create()
            }
            self.request(with: requestObject)
                .responseDecodableObject { (response: AFDataResponse<T>) in
                    self.handle(with: response, observer: observer )
                }
            return Disposables.create()
        }.share().asSingle()
    }

    @discardableResult
    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) -> Single<T> {
        requestObject.headers = createAuthenticatedHeaders(with: requestObject.headers ?? [:])
        return Observable<T>.create { [weak self] observer in
            guard let self = self else {
                observer.onCompleted()
                return Disposables.create()
            }
            self.request(with: requestObject)
                .responseDecodableObject { (response: AFDataResponse<T>) in
                    self.handle(with: response, observer: observer )
                }
            return Disposables.create()
        }.share().asSingle()
    }

    private func request(with requestObject: RequestObject) -> DataRequest {
        AF.request(requestObject.url,
                   method: requestObject.method,
                   parameters: requestObject.data?.dictionary,
                   encoding: requestObject.encoding,
                   headers: requestObject.headers,
                   interceptor: requestObject.requestInterceptor)
    }

    private func handle<T>(with response: AFDataResponse<T>, observer: AnyObserver<T>) {
        switch response.result {
            case .failure(let error):
                handle(with: error, observer: observer, response: response.response, data: response.data)
            case .success(let value):
                observer.onNext(value)
                observer.onCompleted()
        }
    }

    private func handle<T>(with error: Error, observer: AnyObserver<T>, response: HTTPURLResponse?, data: Data?) {
        if let response = response, let httpStatus = response.httpStatus {
            observer.onError(AdessoError.httpError(status: httpStatus, data: data))
        } else {
            observer.onError(AdessoError.unknown(error: error as NSError))
        }
    }

    private func createAuthenticatedHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders {
        headerBuilder.buildAuthenticatedHeaders(with: customHeaders)
    }

    private func createHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders {
        headerBuilder.buildHeaders(with: customHeaders)
    }
}
