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
            Text(" - Куплено!")
                .foregroundColor(.green)
                .font(.headline)
        }
    }
}

struct BoughtProductView_Previews: PreviewProvider {
    static var previews: some View {
        BoughtProductView()
    }
}
