//
//  SnapshotTestCase.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import ios_boilerplate

class SnapshotTestCase: XCTestCase {

    enum SnapshotFormat {
        case image
        case recursiveDescription
    }

    typealias SnapshotArguments = (name: String?,
        recording: Bool,
        timeout: TimeInterval,
        file: StaticString,
        testName: String,
        line: UInt)

    var recordMode: Bool {
        get {
            isRecording
        }
        set {
            isRecording = newValue
        }
    }

    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
    }

    func verifyView(_ view: UIView,
                    dispatchAsyncOnMainThread: Bool = false,
                    as snapshotting: SnapshotFormat = .image,
                    named name: String? = nil,
                    record recording: Bool = false,
                    timeout: TimeInterval = 5,
                    file: StaticString = #file,
                    testName: String = #function,
                    line: UInt = #line) {
        if dispatchAsyncOnMainThread {
            dispatchAsyncAndWait {
                self.assertSnap(view, as: snapshotting, with: (name: name, recording: recording, timeout: timeout, file: file, testName: testName, line: line))
            }
        } else {
            self.assertSnap(view, as: snapshotting, with: (name: name, recording: recording, timeout: timeout, file: file, testName: testName, line: line))
        }
    }

    private func assertSnap(_ view: UIView,
                            as snapshotting: SnapshotFormat = .image,
                            with arguements: SnapshotArguments) {

        switch snapshotting {
            case .image:
                assertImage(view, with: arguements)
            case .recursiveDescription:
                assertRecursiveDescription(view, with: arguements)
        }

    }

    private func assertImage(_ view: UIView,
                             with arguements: SnapshotArguments) {
        assertSnapshot(matching: view,
                       as: .image,
                       named: arguements.name,
                       record: arguements.recording,
                       timeout: arguements.timeout,
                       file: arguements.file,
                       testName: arguements.testName,
                       line: arguements.line)
    }

    private func assertRecursiveDescription(_ view: UIView,
                                            with arguements: SnapshotArguments) {

        assertSnapshot(matching: view,
                       as: .recursiveDescription,
                       named: arguements.name,
                       record: arguements.recording,
                       timeout: arguements.timeout,
                       file: arguements.file,
                       testName: arguements.testName,
                       line: arguements.line)
    }
}
