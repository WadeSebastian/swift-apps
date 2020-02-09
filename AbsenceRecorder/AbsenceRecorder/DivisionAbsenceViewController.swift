//
//  DivisionAbsenceViewController.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 09/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {

    var division: Division?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDivisionCodeDisplay()
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division?.students[indexPath.row].surname
        return cell
    }
    
    func updateDivisionCodeDisplay() {
        navigationItem.title = division?.code
    }
    
}
