//
//  AddButtonView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct ImageOverlay: View{
    
    var body: some View{
        Text("Добавить")
            .font(.headline)
            .foregroundColor(.black)
    }
}

struct AddButtonView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(){
            Image(systemName: "rectangle")
                .resizable()
                .frame(width: 100, height: 55)
                .foregroundColor(.black)

                .overlay(ImageOverlay().cornerRadius(6), alignment: .center)
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
