//
//  HeaderBuilder.swift
//  ios-boilerplate
//
//  Created by developer on 31.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire

class HeaderBuilder: HeaderBuilderProtocol {
    private var headers: HTTPHeaders = [:]

    @discardableResult
    func prepareAuthenticationHeaders(with headers: HTTPHeaders) -> HeaderBuilderProtocol {
        let headers = prepareDefaultHeaders(with: headers).build()
        // add authenticated headers here
        self.headers = headers
        return self
    }

    @discardableResult
    func prepareDefaultHeaders(with headers: HTTPHeaders) -> HeaderBuilderProtocol {
        // add your default headers here
        let defaultHeaders: [String: String] = [:]

        let mergedHeaders = defaultHeaders.merging(headers.dictionary) { _, headers in
            headers
        }
        self.headers = HTTPHeaders(mergedHeaders)
        return self
    }

    func build() -> HTTPHeaders {
        headers
    }
}
