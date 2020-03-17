//
//  TheyWorkForYouAdaptor.swift
//  ProjectExperimentation
//
//  Created by Wade, Sebastian (WING) on 14/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class TheyWorkForYouAdaptor {
    
    let baseURL = "https://www.theyworkforyou.com/api/"
    let key = "FLu2UPEVDZSpA4khhfFx35ka"
    let decoder = JSONDecoder()
    
    func getMemberOfParliamentResponseFromPostcode(postcode: String?, completion: @escaping (MemberOfParliament?) -> MemberOfParliament?) {
        guard let postcode = postcode else {
            print("No postcode provided; Terminating request")
            completion(nil)
            return
        }
        
        let path = "\(baseURL)getMP?key=\(key)&postcode=\(postcode)&always_return=true&output=js"
        
        guard let url = URL(string: path) else {
            print("Invalid URL. Wasn't able to look up MP based on that postcode.")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJsonToMemberOfParliamentResponse(json: data) {
                    let memberOfParliament = MemberOfParliament(forename: response.given_name , surname: response.family_name, constituency: response.constituency, party: response.party)
                    completion(memberOfParliament)
                }
            }
        }.resume()
        
    }
    
    func parseJsonToMemberOfParliamentResponse(json: Data) -> MemberOfParliamentResponse? {
        if let memberOfParliamentResponse = try? decoder.decode(MemberOfParliamentResponse.self, from: json) {
            return memberOfParliamentResponse
        } else {
            print("Failed to decode to Member of Parliament Response")
            return nil
        }
    }
    
}
