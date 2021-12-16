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
    var url: String
    let method: HTTPMethod
    var data: Encodable?
    var headers: HTTPHeaders?
    var encoding: URLEncoding
    var requestInterceptor: Interceptor?

    init(url: String,
         method: HTTPMethod = .get,
         data: Encodable? = nil,
         headers: HTTPHeaders? = nil,
         encoding: URLEncoding = .default,
         requestInterceptor: Interceptor? = nil) {
        self.url = url
        self.method = method
        self.data = data
        self.encoding = encoding
        self.requestInterceptor = requestInterceptor
    }
}
