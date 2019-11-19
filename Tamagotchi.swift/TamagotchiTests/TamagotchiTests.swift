//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Wade, Sebastian (WING) on 19/11/2019.
//  Copyright © 2019 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTagagotchiWithNoArgumentsReturnsNonNilObject() {
        //arrange
        
        //act
        let tamagotchi = Tamagotchi()
        //assert
        XCTAssertNotNil(tamagotchi)
    }

}
