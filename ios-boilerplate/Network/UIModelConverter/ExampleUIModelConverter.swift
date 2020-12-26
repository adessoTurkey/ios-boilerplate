//
//  ExampleUIModelConverter.swift
//  ios-boilerplate
//
//  Created by developer on 29.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

class ExampleUIModelConverter {
    static func convert(with response: ExampleResponse?) -> ExampleUIModel? {
        guard let data = response else { return nil }
        let exampleUIModel = ExampleUIModel(value: data.value)
        return exampleUIModel
    }
}
