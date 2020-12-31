//
//  ErrorResponse.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

class ErrorResponse: Decodable {
    var code: Int?
    var message: String?
    var messages: [String: String]?
}
