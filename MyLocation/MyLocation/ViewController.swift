//
//  ViewController.swift
//  MyLocation
//
//  Created by Bola Ibrahim on 6/29/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    //this variable for set the location
    var locationManager = CLLocationManager()
    let regionraduis : CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    //get my location button
    @IBAction func myLocation(_ sender: Any) {
        locationStatus()

    }
    
    //for showing my location in a radius in the map
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let mylocation = userLocation.location{
            centerMapOnLocation(location: mylocation)
        }
    }
    
    //animation to focus on user location
    func centerMapOnLocation(location : CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionraduis * 2, regionraduis * 2)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //this function take the permission from user to access his location when he use the app and show the user location
    func locationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
   
}

