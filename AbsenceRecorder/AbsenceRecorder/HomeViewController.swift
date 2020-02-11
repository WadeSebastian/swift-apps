//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 04/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        let division = divisions[indexPath.row]
        cell.textLabel?.text = division.code
        cell.accessoryType = (division.getAbsence(for: currentDate) != nil) ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDivision = divisions[indexPath.row]
        var absence = Absence(date: currentDate)
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
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
        tableView.reloadData()
    }
    
    func addDummyData() {
        divisions = DivisionFactory.createDivisions()
        print (((divisions[0]).students[5]).forename)
    }

}

