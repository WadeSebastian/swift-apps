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
    
    var card:Card
    
    init?(coder: NSCoder, card: Card) {
        self.card = card
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this controller with a card")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func generateComment() -> Comment? {
        if subjectTextField.hasText && teacherTextField.hasText && topicsToImproveTextField.hasText {
            let newStudentEvaluation = StudentEvaluation(enjoyment: enjoymentSlider!.value, attainment: attainmentSlider!.value, difficulty: difficultySlider!.value, topicsToImprove: topicsToImproveTextField.text!)
            let newComment = CommentGenerator.generateComment(subject: subjectTextField.text!, teacherInitials: teacherTextField.text!, studentEvaluation: newStudentEvaluation)
            return newComment
        } else {
            return nil
        }
    }
    
    @IBAction func displayGeneratedComment(_ sender: UIButton) {
        let comment = generateComment()
        if comment != nil {
            displayedCommentLabel.text = comment!.content
        } else {
            displayedCommentLabel.text = "Error: One or more fields has not been completed. Please fill in and then press the generate button again."
        }
    }
    
    @IBAction func copyToClipboard(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = displayedCommentLabel.text
    }
    
    @IBAction func saveToCard(_ sender: Any) {
        let newComment = generateComment()
        if newComment != nil {
            card.addCommentToCard(comment: newComment!)
            displayedCommentLabel.text = "Comment successfully saved to \(card.cycleName). You are free to exit the creator."
        } else {
            displayedCommentLabel.text = "Error: One or more fields has not been completed. Please fill in and then press the generate button again before saving to card."
        }
        
    }
}

