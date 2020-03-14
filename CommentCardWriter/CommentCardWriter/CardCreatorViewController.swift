//
//  CardCreatorViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 12/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class CardCreatorViewController: UIViewController {
    
    @IBOutlet var cycleNameTextField: UITextField!
    @IBOutlet var cycleDatePicker: UIDatePicker!
    @IBOutlet var messageLabel: UILabel!
    
    var student: Student

    init?(coder: NSCoder, student: Student) {
        self.student = student
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this controller with a student")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveCardToStudent() {
        if cycleNameTextField.hasText {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_GB")
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            
            let cycleDate = dateFormatter.string(from: cycleDatePicker.date)
            
            let newCard = Card(cycleName: cycleNameTextField.text!, cycleDate: cycleDate)
            student.addCardToStudent(card: newCard)
            messageLabel.text = "Card successfully saved for \(student.forename) \(student.surname). You are free to exit the creator."

        } else {
            messageLabel.text = "ERROR: The cycle name field is empty. Please fill in and then press the save button again."
        }
    }
}
