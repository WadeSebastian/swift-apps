//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Comment: Equatable {
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        return lhs.subject == rhs.subject && lhs.teacherInitials == rhs.teacherInitials && lhs.content == rhs.content
    }
    
    let subject: String
    let teacherInitials: String
    let content: String
    
    init(subject: String, teacherInitials: String, content: String) {
        self.subject = subject
        self.teacherInitials = teacherInitials
        self.content = content
    }
    
    
}
