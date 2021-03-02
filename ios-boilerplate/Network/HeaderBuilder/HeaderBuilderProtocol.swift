//
//  HeaderBuilderProtocol.swift
//  ios-boilerplate
//
//  Created by developer on 31.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire

protocol HeaderBuilderProtocol {
    func prepareAuthenticationHeaders(with headers: HTTPHeaders) -> HeaderBuilderProtocol
    func prepareDefaultHeaders(with headers: HTTPHeaders) -> HeaderBuilderProtocol
    func build() -> HTTPHeaders
}
