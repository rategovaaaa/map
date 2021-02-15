//
//  ViewController.swift
//  ios map rategova
//
//  Created by WSR on 05.02.2021.
//

import UIKit
import CoreLocation
class LocationVC: UIViewController, CLLocationManagerDelegate {

    
    let LocationManager = CLLocationManager()
    
    @IBOutlet weak var dataLat: UILabel!
    @IBOutlet weak var dataLon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
        // Do any additional setup after loading the view.
    }

    func checkAuthorization(){
       
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            LocationManager.delegate = self
            LocationManager.desiredAccuracy = kCLLocationAccuracyBest
            LocationManager.startUpdatingLocation()
            print("Error")
        case .notDetermined:
            LocationManager.requestWhenInUseAuthorization()
        default:
            break
        }
        
    }
    
    func LocationManager(_ manager: CLLocationManager, didUpdateLocations Locations: [CLLocation]) {
        if let Location = Locations.last?.coordinate {
            dataLat.text = String(Location.latitude)
            dataLon.text = String(Location.longitude)
            LocationManager.stopUpdatingLocation()
        }
    }
    
}

