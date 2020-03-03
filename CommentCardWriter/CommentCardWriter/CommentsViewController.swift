//
//  CommentsViewController.swift
//  CommentCardWriter
//
//  Created by Wade, Sebastian (WING) on 03/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {
    
    var card: Card
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return card.comments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Comment", for: indexPath)
        
        cell.textLabel?.text = card.comments[indexPath.row].subject
        cell.detailTextLabel?.text = card.comments[indexPath.row].teacherInitials
        
        return cell 
    }
}
