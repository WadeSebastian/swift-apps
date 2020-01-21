//
//  TamagotchiStarterNames.swift
//  tamagotchiApp
//
//  Created by Wade, Sebastian (WING) on 14/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

struct TamagotchiStarterNames {
    
    static func getRandomName() -> String {
        return ["MaoTing", "YingDong", "WuMing", "DaoZi", "LiangGe"].randomElement()!
    }
}
