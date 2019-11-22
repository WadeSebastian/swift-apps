//
//  Tamagotchi.swift
//  Tamagotchi.swift
//
//  Created by Wade, Sebastian (WING) on 22/11/2019.
//  Copyright © 2019 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Tamagotchi {
    private var age: Int
    var weight: Int
    var happiness: Int = 0
    var hunger: Int = 0
    var discipline: Int = 0
    var isAlive: Bool = true
    var isIll: Bool = false
    var isAsleep: Bool = false
    var needsAttention: Bool = true
    var maxAge: Int = 26
    var name: String
    
    init(name: String) {
        self.name = name
        age = 0
        weight = 5
    }
    
    public func displayAge(age: Int) -> Int {
        return age
    }
    
    func eatMeal(hunger: Int) {
        if hunger == 5 {
            print("I is not full. I no want eat!! :(")
        } else {
            print("Nomm Nomm. Yummy food.")
        }
    }
    
}
