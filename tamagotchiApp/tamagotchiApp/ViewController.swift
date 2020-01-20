//
//  ViewController.swift
//  tamagotchiApp
//
//  Created by Wade, Sebastian (WING) on 14/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resetGameButton: UIButton!
    @IBOutlet var feedMealButton: UIButton!
    @IBOutlet var tamagotchiCoreStatistics: UILabel!
    
    var tamagotchiStarterNames = TamagotchiStarterNames()
    var tamagotchi: Tamagotchi?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(ageTamagotchi), userInfo: nil, repeats: true)
    }
    
    func reset() {
        if let name = tamagotchiStarterNames.names.randomElement() {
            tamagotchi = Tamagotchi(name: name)
        } else {
            tamagotchi = Tamagotchi(name: "Should've left the array alone, shouldn't you!")
        }
        tamagotchiCoreStatistics.text  = tamagotchi?.displayCoreStatistics()
        
    }
    @IBAction func resetGame(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func feedMeal(_ sender: UIButton) {
        
    }
    
    @objc func ageTamagotchi() {
        tamagotchi?.age += 1
        if let tamagotchi = tamagotchi {
            if tamagotchi.age >= tamagotchi.maxAge {
                let alert = UIAlertController(title: "Death Notice", message: "At the ripe old age of \(String(describing: tamagotchi.age)) days, your beloved \(String(describing: tamagotchi.name)) has departed for a better place.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Respawn a new friend", style: .default, handler: { _ in
                    self.reset()
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

