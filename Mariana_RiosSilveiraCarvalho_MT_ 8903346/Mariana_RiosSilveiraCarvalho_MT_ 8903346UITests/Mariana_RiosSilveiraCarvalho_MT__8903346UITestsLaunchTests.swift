//
//  Mariana_RiosSilveiraCarvalho_MT__8903346UITestsLaunchTests.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346UITests
//
//  Created by Mariana Rios Silveira Carvalho on 2023-10-27.
//

import XCTest

final class Mariana_RiosSilveiraCarvalho_MT__8903346UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
