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
      
      CLGeocoder().reverseGeocodeLocation(userLocation) { (placeMarks, error) in
         if error != nil {
            print(error!)
         } else {
            if let placeMark = placeMarks?[0] {
               var subThoroughfare = ""
               
               if placeMark.subLocality != nil {
                  subThoroughfare = placeMark.subThoroughfare!
               }
               
               var thoroughfare = ""
               
               if placeMark.thoroughfare != nil {
                  thoroughfare = placeMark.thoroughfare!
               }
               
               
               var subLocality = ""
               
               if placeMark.subLocality != nil {
                  subLocality = placeMark.subLocality!
               }
               
               var subAdministrativeArea = ""
               
               if placeMark.subAdministrativeArea != nil {
                  subAdministrativeArea = placeMark.subAdministrativeArea!
               }
               
               print(subThoroughfare, thoroughfare, subAdministrativeArea, subLocality, subLocality)
               
            }
         }
      }
      
   }


}

