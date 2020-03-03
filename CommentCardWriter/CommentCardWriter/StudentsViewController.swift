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
        self.students = [Student(forename: "Sebastian", surname: "Wade", trialsNumber: "6507"), Student(forename: "Saxon", surname: "Stacey", trialsNumber: "7469")]
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
