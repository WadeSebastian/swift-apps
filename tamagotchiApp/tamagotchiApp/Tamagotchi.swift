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
    var weight: Int = 1
    var health: Int = 5
    var happiness: Int = 5
    var hunger: Int = 5
    var discipline: Int = 5
    var isAlive: Bool = true
    var isIll: Bool = false
    var isAsleep: Bool = false
    var needsAttention: Bool = true
    var maxAge: Int = 26
    var recommendedHealthyWeight: Double = 5.0
    
    init() {
        name = TamagotchiStarterNames.getRandomName()
    }
    
    func displayRecommendedHealthyWeight() -> String {
        return String(self.recommendedHealthyWeight)
    }
    
    func displayCoreStatistics() -> String {
        return """
            Name: \(name)
                 
            Age: \(age) days
            Weight: \(weight)oz
                                    
            Health: \(health)/5
            Happiness: \(happiness)/5
            Hunger: \(hunger)/5
            Discipline: \(discipline)/5
            """
    }
}
