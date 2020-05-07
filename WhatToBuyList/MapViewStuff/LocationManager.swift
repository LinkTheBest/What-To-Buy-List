//
//  LocationManager.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 28.04.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//
import Foundation
import MapKit

class LocationManager: NSObject{
    
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    
    override init(){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    func showCurrentLocation() -> MKCoordinateRegion{
        let randomRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.937500, longitude: 30.308611), latitudinalMeters: 2000, longitudinalMeters: 2000)
        guard let currentCoordinates = locationManager.location?.coordinate else {return randomRegion}
        let region = MKCoordinateRegion(center: currentCoordinates, latitudinalMeters: 1500, longitudinalMeters: 1500)
        return region
    }
    
}

extension LocationManager: CLLocationManagerDelegate{}
