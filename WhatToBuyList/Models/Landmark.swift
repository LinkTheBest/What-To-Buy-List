//
//  Landmarks.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 04.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//
import Foundation
import MapKit

struct Landmark{
    
    let placemark: MKPlacemark
    
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String{
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D{
        self.placemark.coordinate
    }
}
