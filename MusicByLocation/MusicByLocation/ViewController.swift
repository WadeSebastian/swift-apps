//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Wade, Sebastian (WING) on 28/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = firstLocation.coordinate.latitude.description
                } else {
                    let currentLocation = placemarks?[0]
                    self.musicRecommendations.text = """
                        Country: \(currentLocation?.country ?? "COUNTRY UNAVAILABLE")
                        Province/State: \(currentLocation?.administrativeArea ?? "STATE UNAVAILABLE")
                        County: \(currentLocation?.subAdministrativeArea ?? "COUNTY UNAVAILABLE")
                        City: \(currentLocation?.locality ?? "CITY UNAVAILABLE")
                        
                        Name: \(currentLocation?.name ?? "NAME UNAVAILABLE")
                        Postcode: \(currentLocation?.postalCode ?? "POSTCODE UNAVAILABLE")
                        
                        
                    \(self.updateRecommendedArtists(search: currentLocation?.locality))
                    """
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not acces user's location. Error: \(error.localizedDescription)"
    }
    
    func updateRecommendedArtists(search: String? ) {
        let searchTerm = search?.components(separatedBy: " ").first ?? "Eton"
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=musicArtist")
            else {
                print ("Invalid URL. Wasn't able to search iTunes for recommended artists based on your location.")
                return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
        
    }
    
}

