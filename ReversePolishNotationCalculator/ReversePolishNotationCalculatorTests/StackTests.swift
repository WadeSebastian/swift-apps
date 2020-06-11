//
//  StackTests.swift
//  ReversePolishNotationCalculatorTests
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class StackTests: XCTestCase {
    
    func testPushAddsItemToTopOfStack() {
        //arrange
        var stack = Stack()
        let expected = ["1","22"]
        //act
        stack.push(item: "1")
        stack.push(item: "22")
        let actual = stack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPushIncreasesTopofStackByOneEachTime() {
        //arrange
        var stack = Stack()
        let expected = 1
        //act
        stack.push(item: "1")
        stack.push(item: "22")
        let actual = stack.top
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPeekReturnsTopItemWhenStackIsNotEmpty() {
        //arrange
        var stack = Stack()
        let expected = "22"
        //act
        stack.push(item: "1")
        stack.push(item: "22")
        let actual = stack.peek()
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPeekReturnsErrorWhenStackIsEmpty() {
        //arrange
        let stack = Stack()
        let expected = "[ERROR] Cannot peek: Stack is EMPTY"
        //act
        let actual = stack.peek()
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPopReturnsTopItemWhenStackIsNotEmpty() {
        //arrange
        var stack = Stack()
        stack.push(item: "1")
        stack.push(item: "22")
        let expected = "22"
        //act
        let actual = stack.pop()
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPopRemovesTopItemWhenStackIsNotEmpty() {
        //arrange
        var stack = Stack()
        stack.push(item: "1")
        stack.push(item: "22")
        let expected = ["1"]
        //act
        stack.pop()
        let actual = stack.stack
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPopReducesTopByOneWhenStackIsNotEmpty() {
        //arrange
        var stack = Stack()
        stack.push(item: "1")
        stack.push(item: "22")
        let expected = 0
        //act
        stack.pop()
        let actual = stack.top
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testPopReturnsErrorWhenStackIsEmpty() {
        //arrange
        var stack = Stack()
        let expected = "[ERROR] Cannot pop: Stack is EMPTY"
        //act
        let actual = stack.pop()
        //assert
        XCTAssertEqual(expected, actual)
    }
    
}
