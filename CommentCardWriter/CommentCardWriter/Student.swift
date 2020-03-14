//
//  Student.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Student {
    
    let forename: String
    let surname: String
    let trialsNumber: String
    var cards: [Card]
    
    init(forename: String,surname: String, trialsNumber: String) {
        self.forename = forename
        self.surname = surname
        self.trialsNumber = trialsNumber
        self.cards = []
    }
    
    init(forename: String,surname: String, trialsNumber: String, cards: [Card]) {
        self.forename = forename
        self.surname = surname
        self.trialsNumber = trialsNumber
        self.cards = cards
    }
    
    func addCardToStudent(card: Card) {
        cards.append(card)
    }
    
    func removeCardFromStudent(card: Card) {
        cards.removeAll {
            $0.cycleName == card.cycleName && $0.cycleDate == card.cycleDate && $0.comments == card.comments
        }
    }
    
}
