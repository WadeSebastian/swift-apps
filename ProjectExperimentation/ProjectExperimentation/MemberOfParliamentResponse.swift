//
//  MemberOfParliamentResponse.swift
//  ProjectExperimentation
//
//  Created by Wade, Sebastian (WING) on 14/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

struct MemberOfParliamentResponse: Codable {
    
    var member_id: String
    var house: String
    var constituency: String
    var party: String
    var entered_house: String
    var left_house: String
    var entered_reason: String
    var left_reason: String
    var person_id: String
    var lastupdate: String
    var title: String?
    var given_name: String
    var family_name: String
    var full_name: String
    var url: String
    var image: String
    var image_height: Int
    var image_width: Int
    var office: [Office]?
    
}
