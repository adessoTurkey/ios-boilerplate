//
//  ExampleRequestAdapter.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 8.12.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import Foundation
import Alamofire

class ExampleRequestAdapter: RequestAdapter {
    func adapt(_ urlRequest: URLRequest, for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(urlRequest))
    }
}
