//
//  DivisionAbsenceViewController.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 09/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {

    var division: Division
    var absence: Absence
    
    init?(coder: NSCoder, division: Division, absence: Absence) {
        self.division = division
        self.absence = absence
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this Controller with a Division and Absence")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = division.code
        if let selectedRows = absence.selectedRows {
            for selectedRow in selectedRows {
                tableView.selectRow(at: selectedRow, animated: false, scrollPosition: .none)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division.students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division.students[indexPath.row].surname
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.absent.append(selectedStudent)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedStudent = division.students[indexPath.row]
            absence.absent.removeAll {
                $0.forename == deselectedStudent.forename && $0.surname == deselectedStudent.surname && $0.birthday == deselectedStudent.birthday
            }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        absence.selectedRows = tableView.indexPathsForSelectedRows
    }
    
}
