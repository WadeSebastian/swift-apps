//
//  theyWorkForYouAdaptor.swift
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
    
    func getMP(postcode: String) -> String? {
        let path = "\(baseURL)getMP?key=\(key)&postcode=\(postcode)&always_return=true&output=js"
        guard let url = URL(string: path) else {
            print("Invalid URL. Wasn't able to look up MP based on that postcode.")
            return ""
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                print(String(decoding: data, as: UTF8.self))
            }
        }.resume()
        return ""
    }
    
}
