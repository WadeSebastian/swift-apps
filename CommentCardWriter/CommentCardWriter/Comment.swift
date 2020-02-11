//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Comment {
    
    let subject: String
    let teacherName: String
    let content: String
    
    init(subject: String, teacherName: String, content: String) {
        self.subject = subject
        self.teacherName = teacherName
        self.content = content
    }
    
    
}
