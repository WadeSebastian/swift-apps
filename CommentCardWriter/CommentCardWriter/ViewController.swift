//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
    }

    func addDummyData() {
        let newStudentEvaluation = StudentEvaluation(enjoyment: 5, attainment: 4, difficulty: 3, topicsToImprove: ["essay structure","use of statisctics"])
        let newComment = CommentGenerator.generateComment(subject: "Politics", teacherName: "PSS", studentEvaluation: newStudentEvaluation)
    }
    
}

