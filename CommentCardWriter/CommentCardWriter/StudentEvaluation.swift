//
//  StudentEvaluation.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class StudentEvaluation {
    
    let enjoyment: Int
    let attainment: Int
    let difficulty: Int
    let topicsToImprove: String
    
    init(enjoyment: Float, attainment: Float, difficulty: Float, topicsToImprove: String) {
        self.enjoyment = Int(enjoyment)
        self.attainment = Int(attainment)
        self.difficulty = Int(difficulty)
        self.topicsToImprove = topicsToImprove
    }
    
    
}
