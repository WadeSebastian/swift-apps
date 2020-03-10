//
//  AbsenceRecorderUITests.swift
//  AbsenceRecorderUITests
//
//  Created by Wade, Sebastian (WING) on 04/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class AbsenceRecorderUITests: XCTestCase {

    func testWhenRecordingAnAbsenceStudentsRemainSelected() {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["vCX-1"]/*[[".cells.staticTexts[\"vCX-1\"]",".staticTexts[\"vCX-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["surname1"]/*[[".cells.staticTexts[\"surname1\"]",".staticTexts[\"surname1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["surname2"]/*[[".cells.staticTexts[\"surname2\"]",".staticTexts[\"surname2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["surname3"]/*[[".cells.staticTexts[\"surname3\"]",".staticTexts[\"surname3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["surname4"]/*[[".cells.staticTexts[\"surname4\"]",".staticTexts[\"surname4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["vCX-1"].buttons["March 9, 2020"].tap()
        
        let divisionCell = tablesQuery.cells.element(boundBy: 0)
        let divisionCellNoAbsence = tablesQuery.element(boundBy: 1)
        
        XCTAssertEqual(divisionCell.isSelected, true)
        XCTAssertEqual(divisionCellNoAbsence.isSelected, false)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
