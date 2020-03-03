//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class CommentCreatorViewController: UIViewController {
    
    @IBOutlet var subjectTextField: UITextField!
    @IBOutlet var teacherTextField: UITextField!
    @IBOutlet var enjoymentSlider: UISlider!
    @IBOutlet var attainmentSlider: UISlider!
    @IBOutlet var difficultySlider: UISlider!
    @IBOutlet var topicsToImproveTextField: UITextField!
    @IBOutlet var displayedCommentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func displayGeneratedComment(_ sender: UIButton) {
        if subjectTextField.hasText && teacherTextField.hasText && topicsToImproveTextField.hasText {
            let newStudentEvaluation = StudentEvaluation(enjoyment: enjoymentSlider!.value, attainment: attainmentSlider!.value, difficulty: difficultySlider!.value, topicsToImprove: topicsToImproveTextField.text!)
            let newComment = CommentGenerator.generateComment(subject: subjectTextField.text!, teacherInitials: teacherTextField.text!, studentEvaluation: newStudentEvaluation)
            displayedCommentLabel.text = newComment.content
        } else {
            displayedCommentLabel.text = "Error: One or more fields has not been completed. Please fill in and then press the generate button again."
        }
    }
    
    @IBAction func copyToClipboard(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = displayedCommentLabel.text
    }
}

