//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 04/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        for division in divisions {
            print ("Division code: \(division.code), No. of students: \(division.students.count) ")
            for student in division.students {
                print ("\(student.forename) \(student.surname)")
            }
        }
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.textLabel?.text = divisions[indexPath.row].code
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewController else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        vc.division = divisions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day,value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day,value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func updateDateDisplay() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        navigationItem.title = dateFormatter.string(from: currentDate)
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "vCX-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "vBX-2", of: 4))
        divisions.append(DivisionFactory.createDivision(code: "vDY-1", of: 16))
        divisions.append(DivisionFactory.createDivision(code: "vFH-1", of: 20))
        print (((divisions[0]).students[5]).forename)
    }

}

