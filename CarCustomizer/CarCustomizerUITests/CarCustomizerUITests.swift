//
//  CarCustomizerUITests.swift
//  CarCustomizerUITests
//
//  Created by Wade, Sebastian (WING) on 10/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class CarCustomizerUITests: XCTestCase {
    
    func testWhenExhaustPackageAndTiresPackageBoughtEcuPackageAndRadioPackageAreDisabled() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        app.switches["tiresSwitch"].tap()
        app.switches["engineAndExhaustSwitch"].tap()
        //assert
        XCTAssertEqual(app.switches["ecuAndFuelSwitch"].isEnabled, false)
        XCTAssertEqual(app.switches["fmRadioSwitch"].isEnabled, false)
    }
    
    func testDisplayStatsOnLaunchAreForFirstCarInStarterCars() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = """
            Make: Mazda
            Model: MX-5
            Top Speed: 140mph
            Acceleration (0-60): 7.3s
            Handling: 5
            """
        //act
        let actual = app.staticTexts["selectedCarStatisticsDisplay"].label
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            //Measures how long it takes to launch the application
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
        
    }
}
