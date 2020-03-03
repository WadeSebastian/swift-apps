//
//  Card.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Card {
    
    let cycleName: String
    let cycleDate: [String]
    var comments: [Comment]
    
    init(cycleName: String, cycleDate: [String]) {
        self.cycleName = cycleName
        self.cycleDate = cycleDate
        self.comments = []
    }
    
    func addCommentToCard(comment: Comment) {
        comments.append(comment)
    }
    
    func removeCommentFromCard(comment: Comment) {
        comments.removeAll {
            $0.subject == comment.subject && $0.teacherInitials == comment.teacherInitials && $0.content == comment.content
        }
    }
}
