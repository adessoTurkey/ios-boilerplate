//
//  RequestObject.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Alamofire
import Foundation

struct RequestObject {
    let method: HTTPMethod
    var url: String
    var data: Encodable?
    var headers: HTTPHeaders?
    var encoding: URLEncoding
    var requestInterceptor: Interceptor?

    init(method: HTTPMethod = .get,
         url: String,
         data: Encodable? = nil,
         headers: HTTPHeaders? = nil,
         encoding: URLEncoding = .default,
         requestInterceptor: Interceptor? = nil) {
        self.method = method
        self.url = url
        self.data = data
        self.encoding = encoding
        self.requestInterceptor = requestInterceptor
    }
}
