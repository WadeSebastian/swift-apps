//
//  CommentGenerator.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class CommentGenerator {
    
    static func generateComment(subject: String, teacherInitials: String, studentEvaluation: StudentEvaluation) -> Comment {
        let enjoymentWordChoices = ["disliking","not enjoying","somewhat enjoying","enjoying","greatly enjoying"]
        let attainmentWordChoices = ["poorly","somewhat poorly","averagely","well", "very well"]
        let difficultyWordChoices = ["very easy","somewhat easy","at a suitable level of difficulty","somewhat difficult","very difficult"]
        
        let enjoymentWord = enjoymentWordChoices[studentEvaluation.enjoyment - 1]
        let attainmentWord = attainmentWordChoices[studentEvaluation.attainment - 1]
        let difficultyWord = difficultyWordChoices[studentEvaluation.difficulty - 1]
        
        let content = "I am \(enjoymentWord) \(subject). I feel that I am performing \(attainmentWord) in class. I am finding the subject to be \(difficultyWord). I think that I could improve in these areas: \(studentEvaluation.topicsToImprove)."
        let newComment = Comment(subject: subject, teacherInitials: teacherInitials, content: content)
        
        return newComment
    }
        
}
