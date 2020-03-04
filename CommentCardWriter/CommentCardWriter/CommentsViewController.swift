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
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteComment = UIContextualAction(style: .destructive, title: "Delete Comment") { action, view, completionHandler in
            let alert = UIAlertController(title: "Delete Comment", message: "Are you sure you want to delete your comment for \(self.card.comments[indexPath.row].subject) with \(self.card.comments[indexPath.row].teacherInitials)?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                self.card.removeCommentFromCard(comment: self.card.comments[indexPath.row])
                    tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteComment])
    }
    
    @IBAction func createNewComment(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(identifier: "CommentCreatorViewController", creator: { coder in
            return CommentCreatorViewController(coder: coder, card: self.card)
        }) else {
            fatalError("Failed to load Comment Creator View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
