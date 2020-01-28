//
//  DataStructuresAppTests.swift
//  DataStructuresAppTests
//
//  Created by Wade, Sebastian (WING) on 28/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest
@testable import DataStructuresApp

class DataStructuresAppTests: XCTestCase {

    func testReturnsNilWhenPopOnEmptyStack() {
        //arrange
        let myStack = Stack()
        let expected: Int? = nil
        //act
        let actual = myStack.pop()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnsNilWhenDisplayOnEmptyStack() {
        //arrange
        let myStack = Stack()
        let expected: String? = nil
        //act
        let actual = myStack.display()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnsNilWhenPeekOnEmptyStack() {
        //arrange
        let myStack = Stack()
        let expected: Int? = nil
        //act
        let actual = myStack.peek()
        //assert
        XCTAssertEqual(actual, expected)
    }
        
    func testReturnsCorrectIntWhenPopOnStackWithOneItem() {
        //arrange
        let myStack = Stack()
        myStack.push(item: 3)
        let expected: Int? = 3
        //act
        let actual = myStack.pop()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnsCorrectIntWhenPopOnStackWithMultipleItems() {
        //arrange
        let myStack = Stack()
        myStack.push(item: 3)
        myStack.push(item: 4)
        myStack.push(item: 1)
        let expected: Int? = 1
        //act
        let actual = myStack.pop()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    
}
