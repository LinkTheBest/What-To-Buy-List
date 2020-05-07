//
//  MapView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 28.04.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    let map = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        map.showsUserLocation = true
        map.delegate = context.coordinator
        map.userTrackingMode = .follow
        map.setRegion(locationManager.showCurrentLocation(), animated: true)
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotation(from: uiView)
    }
    
    
    func updateAnnotation(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
