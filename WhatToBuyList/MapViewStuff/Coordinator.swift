//
//  Coordinator.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 28.04.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//
import MapKit
import Foundation

final class Coordinator: NSObject, MKMapViewDelegate{
    
    var control: MapView
    
    init(_ control: MapView){
        self.control = control
    }
    
}
