//
//  ViewController.swift
//  ProjectExperimentation
//
//  Created by Wade, Sebastian (WING) on 13/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var yourMemberOfParliamentNameLabel: UILabel!
    @IBOutlet var yourMemberOfParliamentConstituencyLabel: UILabel!
    @IBOutlet var yourMemberOfParliamentPartyLabel: UILabel!
    
    let theyWorkForYouAdapter = TheyWorkForYouAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayYourMemberOfParliamentDetails()
    }

    func displayYourMemberOfParliamentDetails() {
        let yourMemberOfParliament: MemberOfParliament? = theyWorkForYouAdapter.getMemberOfParliamentResponseFromPostcode(postcode: "CM179JA") { (yourMemberOfParliament: MemberOfParliament?) in
            return yourMemberOfParliament
        }
        
        if let yourMemberOfParliament = yourMemberOfParliament {
            self.yourMemberOfParliamentNameLabel.text = "\(yourMemberOfParliament.forename) \(yourMemberOfParliament.surname)"
            self.yourMemberOfParliamentConstituencyLabel.text = yourMemberOfParliament.constituency
            if yourMemberOfParliament.party == "Conservative" {
                self.yourMemberOfParliamentPartyLabel.textColor = .blue
            } else if yourMemberOfParliament.party == "Labour" {
                self.yourMemberOfParliamentPartyLabel.textColor = .red
            }
            self.yourMemberOfParliamentPartyLabel.text = yourMemberOfParliament.party
        } else {
            print ("Unable to display your Member of Parliament's details")
        }
    }
    
}

