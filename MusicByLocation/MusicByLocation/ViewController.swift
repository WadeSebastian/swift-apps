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
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in if error != nil {
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
                """
                }
            })
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not acces user's location. Error: \(error.localizedDescription)"
    }
    
}

