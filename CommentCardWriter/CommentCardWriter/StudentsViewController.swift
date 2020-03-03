//
//  StudentsViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class StudentsViewController: UITableViewController {

    var students: [Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDummyData()
    }
    
    func loadDummyData() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students?.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath)
        
        cell.textLabel?.text = students?[indexPath.row].name
        cell.detailTextLabel?.text = students?[indexPath.row].trialsNumber
        
        return cell
    }

}
