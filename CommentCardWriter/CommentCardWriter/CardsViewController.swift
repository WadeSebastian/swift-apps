//
//  CardsViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class CardsViewController: UITableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "card", for: indexPath)
        
        cell.textLabel?.text = student.cards[indexPath.row].cycleName
        cell.detailTextLabel?.text = String(describing: student.cards[indexPath.row].cycleDate)
        
        return cell
    }

}
