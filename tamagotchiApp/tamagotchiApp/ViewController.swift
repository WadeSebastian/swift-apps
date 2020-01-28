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
    var timerFired = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        timer = Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(ageTamagotchi), userInfo: nil, repeats: true)
    }
    
    func reset() {
        tamagotchi = Tamagotchi()
        tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
        recommendedHealthyWeight.text = tamagotchi.displayRecommendedHealthyWeight()
    }
    
    func kill(causeOfDeath: String) {
        let alert = UIAlertController(title: "Death Notice", message: "At the ripe old age of \(String(describing: tamagotchi.age)) days, your beloved \(String(describing: tamagotchi.name)) has departed for a better place after dying of \(causeOfDeath).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Respawn a new friend", style: .default, handler: { _ in
            self.reset()
        }))
        self.present(alert, animated: true, completion: nil)
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
        timerFired += 1
        
        if timerFired % 2 == 0 {
            tamagotchi.recommendedHealthyWeight += 2
            recommendedHealthyWeight.text = tamagotchi.displayRecommendedHealthyWeight()
            if tamagotchi.hunger > 0 {
                tamagotchi.hunger -= 1
            }
        }
        if timerFired % 3 == 0 {
            //compares actual weight to recommended weight for healthy tamagotchi
            if (tamagotchi.weight - tamagotchi.recommendedHealthyWeight < -5) || (tamagotchi.weight - tamagotchi.recommendedHealthyWeight > 5) {
                tamagotchi.health -= 1
            }
        }
        //checks if tamagotchi's health is equal to zero, and if so kills it
        let isHealthZero = tamagotchi.isStatisticEqualToZero(statistic: "health")
        if isHealthZero == true {
            kill(causeOfDeath: "neglect")
        }
        //checks if tamagotchi's hunger is equal to zero, and if so takes -1 from its health
        let isHungerZero = tamagotchi.isStatisticEqualToZero(statistic: "hunger")
        if isHungerZero == true {
            tamagotchi.health -= 1
        }

        //updates label to show updated statistics
        tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
        //checks if tamagotchi has reached max age and kills it if so, displaying a death notice
        if tamagotchi.age >= tamagotchi.maxAge {
            kill(causeOfDeath: "old age")
        }
    }

}
