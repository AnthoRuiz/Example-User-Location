//
//  ViewController.swift
//  User Location
//
//  Created by Anthony Ruiz on 8/10/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

   @IBOutlet weak var map: MKMapView!
   var locationManager = CLLocationManager()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      locationManager.delegate =  self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
      
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let userLocation: CLLocation = locations[0]
      
      print(userLocation)
      
      let lat = userLocation.coordinate.latitude
      
      let lon = userLocation.coordinate.longitude
      
      let latDelta: CLLocationDegrees = 0.05
      
      let lonDelta: CLLocationDegrees = 0.05
      
      let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
      
      let coordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
      
      let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
      
      map.setRegion(region, animated: true)
      
   }


}

