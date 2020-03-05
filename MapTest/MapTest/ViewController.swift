//
//  ViewController.swift
//  MapTest
//
//  Created by Raksha Singh on 05/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    // set initial location in Lucknnow
    var lat : CLLocationDegrees?
    var long : CLLocationDegrees?
    let initialLocation = CLLocation(latitude: 26.8467, longitude: 80.9462)
    var newlocation : CLLocationCoordinate2D? = nil
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centerMapOnLocation(location: initialLocation)
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        lat = locValue.latitude
        long = locValue.longitude
        newlocation = locValue
    }


}

