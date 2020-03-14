//
//  StudentsViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class StudentsViewController: UITableViewController {

    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDummyData()
    }
    
    func loadDummyData() {
        let comments = [Comment(subject: "Mandarin", teacherInitials: "HJRM", content: "I am greatly enjoying Mandarin. I feel that I am performing somewhat poorly in class. I am finding the subject to be at a suitable level of difficulty. I think that I could improve in these areas: Timing, handwriting, accent."), Comment(subject: "Early Modern History", teacherInitials: "JDH", content: "I am somewhat enjoying Early Modern History. I feel that I am performing well in class. I am finding the subject to be somewhat easy. I think that I could improve in these areas: Timing, handwriting, use of evidence.")]
        let cards = [Card(cycleName: "Michaelmas Long Leave 2020", cycleDate: "01/11/2020", comments: comments), Card(cycleName: "Summer Long Leave 2019", cycleDate: "01/05/2019", comments: comments)]
        self.students = [Student(forename: "Sebastian", surname: "Wade", trialsNumber: "6507", cards: cards), Student(forename: "Saxon", surname: "Stacey", trialsNumber: "7469", cards: cards)]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        
        cell.textLabel?.text = "\(students[indexPath.row].surname), \(students[indexPath.row].forename)"
        cell.detailTextLabel?.text = students[indexPath.row].trialsNumber
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = students[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "CardsViewController", creator: { coder in
            return CardsViewController(coder: coder, student: selectedStudent)
        }) else {
            fatalError("Failed to load Cards View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
