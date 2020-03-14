//
//  ViewController.swift
//  ProjectExperimentation
//
//  Created by Wade, Sebastian (WING) on 13/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let theyWorkForYouAdapter = TheyWorkForYouAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(theyWorkForYouAdapter.getMP(postcode: "CM179JA"))
    }


    
}

