//
//  BoughtProductView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct BoughtProductView: View {
    var body: some View {
        ZStack(alignment: .top){
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 90, height: 35)
                .foregroundColor(.green)
                .shadow(radius: 4)
                .cornerRadius(5)
                .overlay(Text("Куплено!")
                    .font(.subheadline)
                    .animation(.spring()))
        }
    }
}

struct BoughtProductView_Previews: PreviewProvider {
    static var previews: some View {
        BoughtProductView()
    }
}
