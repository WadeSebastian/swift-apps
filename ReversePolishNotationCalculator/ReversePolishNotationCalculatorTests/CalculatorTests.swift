//
//  CalculatorTests.swift
//  ReversePolishNotationCalculatorTests
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    func testAddOperandToStackAddsItemToTopOfExpressionStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["22"]
        //act
        calculator.addOperandToStack(operand: "22")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperandToStackAddsItemToEndOfExpressionString() {
        //arrange
        let calculator = Calculator()
        let expected = "223"
        //act
        calculator.addOperandToStack(operand: "22")
        calculator.addOperandToStack(operand: "3")
        let actual = calculator.expressionString
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testClearStackMakesExpressionStackEmpty() {
        //arrange
        let calculator = Calculator()
        let expected = [String]()
        calculator.addOperandToStack(operand: "22")
        calculator.addOperandToStack(operand: "3")
        //act
        calculator.clearStack()
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testClearStackMakesTopOfExpressionStackEqualToMinusOne() {
        //arrange
        let calculator = Calculator()
        let expected = -1
        calculator.addOperandToStack(operand: "22")
        calculator.addOperandToStack(operand: "3")
        //act
        calculator.clearStack()
        let actual = calculator.expressionStack.top
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testClearStackMakesExpressionStringEmpty() {
        //arrange
        let calculator = Calculator()
        let expected = ""
        calculator.addOperandToStack(operand: "22")
        calculator.addOperandToStack(operand: "3")
        //act
        calculator.clearStack()
        let actual = calculator.expressionString
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackDoesNotChangeExpressionStackIfExpressionStackHasOnlyOneItem() {
        //arrange
        let calculator = Calculator()
        let expected = ["22"]
        calculator.addOperandToStack(operand: "22")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "+")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackDoesNotChangeExpressionStackIfTheTwoItemsPrecedingItAreNotOperands() {
        //arrange
        let calculator = Calculator()
        let expected = ["33","22","+"]
        calculator.expressionStack.stack = ["33","22","+"]
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "-")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackAddsResultOfAdditionOperatorAndTwoPrecedingOperandsToTopOfStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["55"]
        calculator.addOperandToStack(operand: "22")
        calculator.addOperandToStack(operand: "33")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "+")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackAddsResultOfSubtractionOperatorAndTwoPrecedingOperandsToTopOfStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["11"]
        calculator.addOperandToStack(operand: "33")
        calculator.addOperandToStack(operand: "22")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "-")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackAddsResultOfMultiplicationOperatorAndTwoPrecedingOperandsToTopOfStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["88"]
        calculator.addOperandToStack(operand: "4")
        calculator.addOperandToStack(operand: "22")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "*")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackAddsResultOfDivisionOperatorAndTwoPrecedingOperandsToTopOfStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["5"]
        calculator.addOperandToStack(operand: "20")
        calculator.addOperandToStack(operand: "4")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "/")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testAddOperatorToStackAddsOperatorToEndOfExpressionString() {
        //arrange
        let calculator = Calculator()
        let expected = "204+"
        calculator.addOperandToStack(operand: "20")
        calculator.addOperandToStack(operand: "4")
        //act
        calculator.addOperatorToStack(arithmeticOperatorString: "+")
        let actual = calculator.expressionString
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testCalculatorAddsCorrectResultOfDivisionAndSubtractionToTopOfExpressionStack() {
        //arrange
        let calculator = Calculator()
        let expected = ["-1"]
        //act
        calculator.addOperandToStack(operand: "3")
        calculator.addOperandToStack(operand: "5")
        calculator.addOperatorToStack(arithmeticOperatorString: "*")
        calculator.addOperandToStack(operand: "4")
        calculator.addOperandToStack(operand: "4")
        calculator.addOperatorToStack(arithmeticOperatorString: "*")
        calculator.addOperatorToStack(arithmeticOperatorString: "-")
        let actual = calculator.expressionStack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
}
