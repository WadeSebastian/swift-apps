//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Wade, Sebastian (WING) on 10/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var ecuAndFuelPackage: UISwitch!
    @IBOutlet var fmRadioPackage: UISwitch!
    @IBOutlet weak var carStatistics: UILabel!
    @IBOutlet var remainingFundsDisplay: UILabel!
    @IBOutlet var remainingTimeDisplay: UILabel!
    
    var remainingTime = 30 {
        didSet {
            remainingTimeDisplay.text = "\(remainingTime)"
        }
    }
    var remainingFunds = 0 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            disableUnaffordablePackages()
        }
    }
    var starterCars = StarterCars()
    var currentCarIndex = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[currentCarIndex]
        reset()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        remainingTimeDisplay.text = "\(remainingTime)"
    }
    
    func reset() {
        remainingFunds = 1_000
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        ecuAndFuelPackage.setOn(false, animated: true)
        fmRadioPackage.setOn(false, animated: true)
    }
    
    func disableUnaffordablePackages() {
        engineAndExhaustPackage.isEnabled = shouldBeEnabled(chosenSwitch: engineAndExhaustPackage)
        tiresPackage.isEnabled = shouldBeEnabled(chosenSwitch: tiresPackage)
        ecuAndFuelPackage.isEnabled = shouldBeEnabled(chosenSwitch: ecuAndFuelPackage)
        fmRadioPackage.isEnabled = shouldBeEnabled(chosenSwitch: fmRadioPackage)
    }
    
    func shouldBeEnabled(chosenSwitch: UISwitch) -> Bool {
        if chosenSwitch.isOn {
            return true
        } else {
            if remainingFunds >= 750 {
                return true
            } else if remainingFunds >= 500 {
                let switchName = chosenSwitch.accessibilityIdentifier
                if switchName == "ecuAndFuelSwitch" {
                    return false
                } else {
                    return true
                }
            } else if remainingFunds >= 250 {
                let switchName = chosenSwitch.accessibilityIdentifier
                if switchName == "fmRadioSwitch" {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    @IBAction func changeCar(_ sender: Any) {
        currentCarIndex = currentCarIndex + 1
        if currentCarIndex >= starterCars.cars.count {
                currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
        reset()
    }
    
    
    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 10
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 10
            remainingFunds += 500
        }
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
    }
    
    @IBAction func ecuAndFuelPackageToggle(_ sender: Any) {
        if ecuAndFuelPackage.isOn {
            car?.acceleration += 2
            car?.topSpeed += 15
            remainingFunds -= 750
        } else {
            car?.acceleration -= 2
            car?.topSpeed -= 15
            remainingFunds += 750
        }
    }
    
    @IBAction func fmRadioPackageToggle(_ sender: Any) {
        if fmRadioPackage.isOn {
            car?.topSpeed += 5
            car?.acceleration += 1
            remainingFunds -= 250
        } else {
            car?.topSpeed -= 5
            car?.acceleration -= 1
            remainingFunds += 250
        }
    }
    
    @objc func countdown() {
        if remainingTime > 0 {
            remainingTime -= 1
        } else {
            timer?.invalidate()
            engineAndExhaustPackage.isEnabled = false
            tiresPackage.isEnabled = false
            ecuAndFuelPackage.isEnabled = false
            fmRadioPackage.isEnabled = false
        }
    }
    
}

