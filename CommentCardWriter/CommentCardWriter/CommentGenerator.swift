//
//  CommentGenerator.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class CommentGenerator {
    
    static func generateComment(subject: String, teacherName: String, studentEvaluation: StudentEvaluation) -> Comment {
        let enjoymentWordChoices = ["disliking","not enjoying","somewhat enjoying","enjoying","greatly enjoying"]
        let attainmentWordChoices = ["poorly","somewhat poorly","averagely","well", "very well"]
        let difficultyWordChoices = ["very difficult","somewhat difficult","at a suitable level of difficulty","somewhat easy","very easy"]
        
        let enjoymentWord = enjoymentWordChoices[studentEvaluation.enjoyment - 1]
        let attainmentWord = attainmentWordChoices[studentEvaluation.attainment - 1]
        let difficultyWord = difficultyWordChoices[studentEvaluation.difficulty - 1]
        var topicsToImproveSentence = ""
        for item in studentEvaluation.topicsToImprove {
            topicsToImproveSentence += item + ", "
        }
        
        let content = "I am \(enjoymentWord) \(subject). I feel that I am performing \(attainmentWord) in class. I am finding the subject to be \(difficultyWord). I think that I could improve in these areas: /()"
        let newComment = Comment(subject: subject, teacherName: teacherName, content: content)
        
        return newComment
    }
        
}
