//
//  ViewController.swift
//  tamagotchiApp
//
//  Created by Wade, Sebastian (WING) on 14/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tamagotchiCoreStatistics: UILabel!
    
    var tamagotchiStarterNames = TamagotchiStarterNames()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        var tamagotchiCoreStatistics.text  = tamagotchi.displayCoreStatistics()
    }
    
    func reset() {
        if let name = tamagotchiStarterNames.names.randomElement() {
           var tamagotchi = Tamagotchi(name: name)
        }
        
    }

}

