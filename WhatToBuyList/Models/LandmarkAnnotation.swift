//
//  LandmarkAnnotation.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 04.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//
import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation{
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark){
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
