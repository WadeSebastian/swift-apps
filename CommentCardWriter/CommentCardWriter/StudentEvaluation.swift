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
    let topicsToImprove: [String]
    
    init(enjoyment: Int, attainment: Int, difficulty: Int, topicsToImprove: [String]) {
        self.enjoyment = enjoyment
        self.attainment = attainment
        self.difficulty = difficulty
        self.topicsToImprove = topicsToImprove
    }
    
    
}
