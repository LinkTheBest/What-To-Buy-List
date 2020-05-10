//
//  AddButtonView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI
struct AddButtonView: View {
    var body: some View {
        VStack(){
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 100, height: 45)
                .foregroundColor(.white)
                .cornerRadius(6)
            
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView()
    }
}
