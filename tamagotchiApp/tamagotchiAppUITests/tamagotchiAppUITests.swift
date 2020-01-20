//
//  tamagotchiAppUITests.swift
//  tamagotchiAppUITests
//
//  Created by Wade, Sebastian (WING) on 14/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class tamagotchiAppUITests: XCTestCase {

    func testExample() {
        //arrange
        let app = XCUIApplication()
        let expected = """
            Name: \(name)
                 
            Age: 0 days
            Weight: 5oz
                                    
            Health: 5/5
            Happiness: 5/5
            Hunger: 5/5
            Discipline: 5/5
            """
        //Act
        let actual = app.staticTexts["tamagotchiCoreStatisticsLabel"].label
        //Assert
        XCTAssertEqual(actual, expected)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // Measures how long it takes to launch the application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
