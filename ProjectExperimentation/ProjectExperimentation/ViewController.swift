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
        
        theyWorkForYouAdapter.getMemberOfParliamentResponseFromPostcode(postcode: "CM179JA") { (response) -> MemberOfParliament? in
            if let response = response {
                let memberOfParliament = MemberOfParliament(forename: response.given_name , surname: response.family_name, constituency: response.constituency, party: response.party)
                print(memberOfParliament.constituency)
                return memberOfParliament
            } else {
                return nil
            }
        }
    }

}

