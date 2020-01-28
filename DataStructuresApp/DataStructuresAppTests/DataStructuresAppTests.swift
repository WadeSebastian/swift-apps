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
        var myStack = Stack()
        let expected: Int? = nil
        //act
        let actual = myStack.pop()
        //assert
        XCTAssertEqual(actual, expected)
    }

}
