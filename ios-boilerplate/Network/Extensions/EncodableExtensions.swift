//
//  EncodableExtensions.swift
//  ios-boilerplate
//
//  Created by developer on 26.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
