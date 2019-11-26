//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Wade, Sebastian (WING) on 19/11/2019.
//  Copyright © 2019 Wade, Sebastian (WING). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTamagotchiReturnsNonNilObjectAndSetsNameCorrectly() {
        //arrange
        let name: String = "Stevo"
        //act
        let tamagotchi = Tamagotchi(name: name)
        //assert
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.name, name)
    }
    
    func testEatMealReturnsHungerPlusOneWhenHungerIsntFive() {
        //arrange
        let tamagotchi = Tamagotchi(name: "Stevo")
        tamagotchi.hunger = 3
        //act
        tamagotchi.eatMeal()
        //assert
        XCTAssertEqual(tamagotchi.hunger, 4)
    }

}
