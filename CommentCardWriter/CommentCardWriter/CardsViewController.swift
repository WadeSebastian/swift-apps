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
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Card", for: indexPath)
        
        cell.textLabel?.text = student.cards[indexPath.row].cycleName
        cell.detailTextLabel?.text = student.cards[indexPath.row].cycleDate
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCard = student.cards[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "CommentsViewController", creator: { coder in
            return CommentsViewController(coder: coder, card: selectedCard)
        }) else {
            fatalError("Failed to load Comments View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteCard = UIContextualAction(style: .destructive, title: "Delete Card") { action, view, completionHandler in
            let alert = UIAlertController(title: "Delete Card", message: "Are you sure you want to delete your card for \(self.student.cards[indexPath.row].cycleName)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                self.student.removeCardFromStudent(card: self.student.cards[indexPath.row])
                    tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteCard])
    }
    
    @IBAction func createNewCard(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(identifier: "CardCreatorViewController", creator: { coder in
            return CardCreatorViewController(coder: coder, student: self.student)
        }) else {
            fatalError("Failed to load Card Creator View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
