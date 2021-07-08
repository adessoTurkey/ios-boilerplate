//
//  XCTestCase+Additions.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import XCTest

extension XCTestCase {
    func AssertThrow<R, E>(_ expectedError: E, _ closure: @autoclosure () throws -> R) where E: Error, E: Equatable { // swiftlint:disable:this identifier_name
        do {
            _ = try closure()
            XCTFail("Expected error \"\(expectedError)\", "
                + "but closure succeeded.")
        } catch let error as E {
            XCTAssertEqual(error, expectedError,
                           "Catched error is from expected type, "
                            + "but not the expected case.")
        } catch {
            XCTFail("Catched error \"\(error)\", "
                + "but not the expected error "
                + "\"\(expectedError)\".")
        }
    }

    func defaultExpectation(_ caller: String = #function, line: Int = #line) -> XCTestExpectation {
        expectation(description: "\(caller):\(line) expectation")
    }

    func XCTAssertThrowsNoError(message: String = "", file: String = #file, line: UInt = #line, _ block: () throws -> Void) {
        do {
            try block()
        } catch let excep {
            let exceptionDescription = excep.localizedDescription
            let msg = message.isEmpty ? "Tested block threw unexpected error.: \(exceptionDescription)" : message
            deprecatedRecordFailure(withDescription: msg, inFile: file, atLine: Int(line), expected: true)
        }
    }

    func XCTAssertEmpty<T>(_ list: [T], file: String = #file, line: UInt = #line) {
        if !list.isEmpty {
            deprecatedRecordFailure(withDescription: "Expected an empty list of: \(type(of: list))", inFile: file, atLine: Int(line), expected: true)
        }
    }

    func wait(for expectation: XCTestExpectation, timeout seconds: TimeInterval = 1.0) {
        wait(for: [expectation], timeout: seconds)
    }

    func waitForExpectations(_ timeout: TimeInterval = 2.0, file: String = #file, line: UInt = #line) {
        waitForExpectations(timeout: timeout) { error in
            guard let error = error else { return }

            self.deprecatedRecordFailure(withDescription: "An expectation got not fied: \(error.localizedDescription)",
                inFile: file,
                atLine: Int(line),
                expected: true)
        }
    }

    func wait(timeInterval: TimeInterval) {
        let waitExpectation = self.expectation(description: "wait \(timeInterval) seconds")

        DispatchQueue.global(qos: .default).async {
            Thread.sleep(forTimeInterval: timeInterval)
            waitExpectation.fulfill()
        }

        wait(for: [waitExpectation], timeout: timeInterval + 0.1)
    }

    func dispatchAsyncAndWait(timeout: TimeInterval = 1, file: String = #file, line: UInt = #line, execute work: @escaping () -> Void) {
        let expectation = self.expectation(description: "Code is run on the main dispatch queue")

        DispatchQueue.main.async {
            work()
            expectation.fulfill()
        }

        let waiter = XCTWaiter()
        let result = waiter.wait(for: [expectation], timeout: timeout)

        if result != .completed {
            deprecatedRecordFailure(withDescription: "Timeout exceeded while waiting to dispatch code on main thread",
                                    inFile: file, atLine: Int(line), expected: false)
        }
    }

    func deprecatedRecordFailure(withDescription description: String, inFile filePath: String, atLine lineNumber: Int, expected: Bool) {
        let location = XCTSourceCodeLocation(filePath: filePath, lineNumber: lineNumber)
        let context = XCTSourceCodeContext(location: location)
        let issue = XCTIssue(type: .assertionFailure,
                             compactDescription: description,
                             detailedDescription: nil,
                             sourceCodeContext: context,
                             associatedError: nil,
                             attachments: [])
        record(issue)
    }
}
