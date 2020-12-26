//
//  RequestObject.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Alamofire
import Foundation

class RequestObject {
    var url: String {
        baseUrl + endpoint
    }
    private let baseUrl: String
    private let endpoint: String
    let method: HTTPMethod
    var data: Encodable?
    var encoding: URLEncoding
    var headers: HTTPHeaders?
    var requestInterceptor: RequestInterceptor?

    init(baseUrl: String,
         endpoint: String,
         method: HTTPMethod = .get,
         data: Encodable? = nil,
         encoding: URLEncoding = .default,
         headers: HTTPHeaders? = nil,
         requestInterceptor: RequestInterceptor? = nil) {
        self.baseUrl = baseUrl
        self.endpoint = endpoint
        self.method = method
        self.data = data
        self.encoding = encoding
        self.headers = headers
        self.requestInterceptor = requestInterceptor
    }
}
