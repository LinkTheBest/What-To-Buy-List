//
//  MainMapView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 28.04.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct MainMapView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
