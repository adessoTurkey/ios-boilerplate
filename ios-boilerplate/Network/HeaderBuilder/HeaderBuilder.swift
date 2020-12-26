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
    func buildAuthenticatedHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders {
        let headers = buildHeaders(with: customHeaders)
        // add your authanticated headers here
        return headers
    }

    func buildHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders {
        // add your default headers here
        let defaultHeaders: [String: String] = [:]

        let mergedHeaders = defaultHeaders.merging(customHeaders.dictionary) { _, customHeaders in
            customHeaders
        }
        return HTTPHeaders(mergedHeaders)
    }
}
