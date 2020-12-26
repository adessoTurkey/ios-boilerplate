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
    func buildAuthenticatedHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders
    func buildHeaders(with customHeaders: HTTPHeaders) -> HTTPHeaders
}
