//
//  ReversePolishNotationCalculatorUITests.swift
//  ReversePolishNotationCalculatorUITests
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class ReversePolishNotationCalculatorUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testExpressionDisplayUpdatedWithCorrectNumberWhenOneButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "1"
        //act
        app.buttons["oneButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenTwoButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "2"
        //act
        app.buttons["twoButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenThreeButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "3"
        //act
        app.buttons["threeButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenFourButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4"
        //act
        app.buttons["fourButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenFiveButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "5"
        //act
        app.buttons["fiveButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenSixButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "6"
        //act
        app.buttons["sixButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenSevenButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "7"
        //act
        app.buttons["sevenButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenEightButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "8"
        //act
        app.buttons["eightButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenNineButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "9"
        //act
        app.buttons["nineButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumberWhenZeroButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "0"
        //act
        app.buttons["zeroButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectNumbersWhenMultipleNumberButtonsPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "42"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testErrorMessageDisplayedIfUserEntersPositiveOperandOutsideAcceptedRange() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Sorry but you can only enter operands between -999 and +999 inclusive."
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["zeroButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testErrorMessageDisplayedIfUserEntersNegativeOperandOutsideAcceptedRange() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Sorry but you can only enter operands between -999 and +999 inclusive."
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["plusMinusButton"].tap()
        app.buttons["zeroButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithNegativeSignInCorrectPlaceWhenPlusNegativeButtonPressedForPositiveNumber() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "-42"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["plusMinusButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedToRemoveNegativeSignFromCorrectPlaceWhenPlusNegativeButtonPressedForNegativeNumber() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "42"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["plusMinusButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["plusMinusButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenAdditionButtonPressedWhenPrecededByTwoOperandsWithEnterOPressedAfterEachOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212+"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["additionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenAdditionButtonPressedWhenPrecededByTwoOperandsWithEnterOnlyPressedAfterFirst() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212+"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["additionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithErrorMessageWhenAdditionButtonPressedWhenPrecededByOnlyOneOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Please enter two operands before adding an operator"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["additionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenSubtractionButtonPressedWhenPrecededByTwoOperandsWithEnterOPressedAfterEachOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212-"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["subtractionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenSubtractionButtonPressedWhenPrecededByTwoOperandsWithEnterOnlyPressedAfterFirst() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212-"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["subtractionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithErrorMessageWhenSubtractionButtonPressedWhenPrecededByOnlyOneOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Please enter two operands before adding an operator"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["subtractionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenMultiplicationButtonPressedWhenPrecededByTwoOperandsWithEnterOPressedAfterEachOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212*"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["multiplicationButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenMultiplicationButtonPressedWhenPrecededByTwoOperandsWithEnterOnlyPressedAfterFirst() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212*"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["multiplicationButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithErrorMessageWhenMultiplicationButtonPressedWhenPrecededByOnlyOneOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Please enter two operands before adding an operator"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["multiplicationButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenDivisionButtonPressedWhenPrecededByTwoOperandsWithEnterOPressedAfterEachOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212/"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["divisionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWhenDivisionButtonPressedWhenPrecededByTwoOperandsWithEnterOnlyPressedAfterFirst() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "4212/"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["divisionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithErrorMessageWhenDivisionButtonPressedWhenPrecededByOnlyOneOperand() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "Please enter two operands before adding an operator"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["divisionButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayClearedWhenClearButtonPressed() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "1"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["clearButton"].tap()
        app.buttons["oneButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectResultWhenEvaluateButtonPressedForSimpleExpression() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "3"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["divisionButton"].tap()
        app.buttons["evaluateButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectResultWhenEvaluateButtonPressedForComplexExpression() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "33"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["divisionButton"].tap()
        app.buttons["threeButton"].tap()
        app.buttons["zeroButton"].tap()
        app.buttons["additionButton"].tap()
        app.buttons["evaluateButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testExpressionDisplayUpdatedWithCorrectResultWhenEvaluateButtonPressedForSimpleExpressionWherePartWasEvaluatedPreviously() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "33"
        //act
        app.buttons["fourButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["enterButton"].tap()
        app.buttons["oneButton"].tap()
        app.buttons["twoButton"].tap()
        app.buttons["divisionButton"].tap()
        app.buttons["evaluateButton"].tap()
        app.buttons["threeButton"].tap()
        app.buttons["zeroButton"].tap()
        app.buttons["additionButton"].tap()
        app.buttons["evaluateButton"].tap()
        let actual = app.staticTexts["expressionDisplayLabel"].label
        //assert
        XCTAssertEqual(expected, actual)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
