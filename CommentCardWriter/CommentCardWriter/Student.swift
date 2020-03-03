//
//  Student.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Student {
    
    let name: String
    let trialsNumber: String
    var cards: [Card]
    
    init(name: String, trialsNumber: String) {
        self.name = name
        self.trialsNumber = trialsNumber
        self.cards = []
    }
}
