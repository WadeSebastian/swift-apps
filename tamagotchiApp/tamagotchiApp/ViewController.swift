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
    @IBOutlet var recommendedHealthyWeight: UILabel!
    
    var tamagotchiStarterNames = TamagotchiStarterNames()
    var tamagotchi = Tamagotchi()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(ageTamagotchi), userInfo: nil, repeats: true)
    }
    
    func reset() {
        tamagotchi = Tamagotchi()
        tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
        recommendedHealthyWeight.text = tamagotchi.displayRecommendedHealthyWeight()
    }
    @IBAction func resetGame(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func feedMeal(_ sender: UIButton) {
        if tamagotchi.hunger < 4 {
            tamagotchi.hunger += 2
        } else {
            tamagotchi.weight += (2 - (5 - (tamagotchi.hunger)))
        }
        tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
    }
    
    @objc func ageTamagotchi() {
        tamagotchi.age += 1
        tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
        tamagotchi.recommendedHealthyWeight += 1.5
        recommendedHealthyWeight.text = tamagotchi.displayRecommendedHealthyWeight()
        if tamagotchi.age >= tamagotchi.maxAge {
            let alert = UIAlertController(title: "Death Notice", message: "At the ripe old age of \(String(describing: tamagotchi.age)) days, your beloved \(String(describing: tamagotchi.name)) has departed for a better place.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Respawn a new friend", style: .default, handler: { _ in
                    self.reset()
                }))
                self.present(alert, animated: true, completion: nil)
            
        }
    }

}
