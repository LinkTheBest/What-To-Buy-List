//
//  NearestPlacesListView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 10.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct NearestPlacesListView: View {
    
    let landmarks:[Landmark]
    var body: some View {
        List(){
            ForEach(self.landmarks, id: \.id){ place in
                VStack(alignment: .leading){
                    Text(place.name)
                        .font(.headline)
                    Text(place.title)
                        .font(.subheadline)
                }
            }.animation(.linear)
        }
    }
}

//struct NearestPlacesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NearestPlacesListView(landmarks: [])
//    }
//}
