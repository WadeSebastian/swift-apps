//
//  Car.swift
//  CarCustomizer
//
//  Created by Wade, Sebastian (WING) on 10/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

struct Car {
    var make: String
    var model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)mph
            Acceleration (0-60): \(acceleration)s
            Handling: \(handling)
            """
    }
}
