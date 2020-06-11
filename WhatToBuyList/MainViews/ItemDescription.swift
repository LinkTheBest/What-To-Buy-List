//
//  ItemDescription.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 25.04.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI
import MapKit
struct ItemDescription: View {
    
    var name: String
    var category: String
    let locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State var isPressed = false
    
    func getLocalShops(category: String){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = category
        
        let search = MKLocalSearch(request: searchRequest)
        if(self.isPressed){
            search.start { response, error in
                guard let response = response else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error").")
                    return
                }
                let mapItems = response.mapItems
                self.landmarks = mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
            }
        } else{
            search.cancel()
        }
    }
    
    var body: some View {
        VStack(){
            MapView(landmarks: landmarks)
                .clipped()
                .edgesIgnoringSafeArea(.all)
                .shadow(radius: 5)
            HStack(){
                Button(action:{
                    self.isPressed.toggle()
                    if(self.isPressed){
                        self.getLocalShops(category: self.category)
                    }else{
                        self.landmarks.removeAll()
                    }
                }){
                    Image(systemName: isPressed ? "cart.fill.badge.minus": "cart.fill.badge.plus")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 45, height: 35)
                }
                .padding()
                NavigationLink(destination: MapView(landmarks: landmarks).edgesIgnoringSafeArea(.all)){
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 35, height: 35)
                    
                }
            }
            
            Divider()
            VStack(alignment: .center){
                ItemListView(name: name, category: category)
                Divider()
                NearestPlacesListView(landmarks: landmarks)
            }
        }
    }
}

struct ItemDescription_Previews: PreviewProvider {
    static var previews: some View {
        ItemDescription(name:"", category: "")
    }
}
