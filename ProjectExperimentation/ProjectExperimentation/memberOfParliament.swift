//
//  MemberOfParliament.swift
//  ProjectExperimentation
//
//  Created by Wade, Sebastian (WING) on 14/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class MemberOfParliament {
    
    let forename: String
    let surname: String
    let constituency: String
    let party: String
    
    init(forename: String, surname: String, constituency: String, party: String) {
        self.forename = forename
        self.surname = surname
        self.constituency = constituency
        self.party = party
    }
    
}
