//
//  Tamagotchi.swift
//  tamagotchiApp
//
//  Created by Wade, Sebastian (WING) on 14/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

struct Tamagotchi {
    var name: String
    var age: Int = 0
    var weight: Int = 5
    var health: Int = 5
    var happiness: Int = 5
    var hunger: Int = 5
    var discipline: Int = 5
    var isAlive: Bool = true
    var isIll: Bool = false
    var isAsleep: Bool = false
    var needsAttention: Bool = true
    var maxAge: Int = 26
    
    func displayCoreStats() -> String {
        return """
            Name: \(name)
            Age: \(age)
            Weight: \(weight)
            
            Health: \(health)
            Happiness: \(happiness)
            Hunger: \(hunger)
            Discipline: \(discipline)
            """
    }
}
