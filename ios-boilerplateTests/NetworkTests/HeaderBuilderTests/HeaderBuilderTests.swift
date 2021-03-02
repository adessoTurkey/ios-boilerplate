//
//  HeaderBuilderTests.swift
//  ios-boilerplateTests
//
//  Created by developer on 31.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import XCTest
import Alamofire
@testable import ios_boilerplate

class HeaderBuilderTests: XCTestCase {
    var sut: HeaderBuilderProtocol!

    override func setUp() {
        sut = HeaderBuilder()
    }

    override func tearDown() {
        sut = nil
    }

    func testDefaultHeadersWithNoCustomHeader() {
        // Given
        let givenHeaders: HTTPHeaders = HTTPHeaders()
        let expectedHeaders: HTTPHeaders = HTTPHeaders()

        //When
        let resultHeaders = sut
            .prepareDefaultHeaders(with: givenHeaders)
            .build()

        //Then
        XCTAssertEqual(expectedHeaders.dictionary, resultHeaders.dictionary)
    }

    func testDefaultHeadersWithCustomHeader() {
        // Given
        let givenHeaders: HTTPHeaders =  HTTPHeaders(["key": "value"])
        let expectedHeaders: HTTPHeaders = HTTPHeaders(["key": "value"])

        //When
        let resultHeaders = sut
            .prepareDefaultHeaders(with: givenHeaders)
            .build()

        //Then
        XCTAssertEqual(expectedHeaders.dictionary, resultHeaders.dictionary)
    }

    func testAuthenticatedHeadersWithNoCustomHeader() {
        // Given
        let givenHeaders: HTTPHeaders = HTTPHeaders()
        let expectedHeaders: HTTPHeaders = HTTPHeaders()

        //When
        let resultHeaders = sut
            .prepareAuthenticatedHeaders(with: givenHeaders)
            .build()

        //Then
        XCTAssertEqual(expectedHeaders.dictionary, resultHeaders.dictionary)
    }

    func testAuthenticatedHeadersWithCustomHeader() {
        // Given
        let givenHeaders: HTTPHeaders = HTTPHeaders(["key": "value"])
        let expectedHeaders: HTTPHeaders = HTTPHeaders(["key": "value"])

        //When
        let resultHeaders = sut
            .prepareAuthenticatedHeaders(with: givenHeaders)
            .build()

        //Then
        XCTAssertEqual(expectedHeaders.dictionary, resultHeaders.dictionary)
    }
}
