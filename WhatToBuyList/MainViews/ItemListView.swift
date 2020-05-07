//
//  ItemListView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 06.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI
struct ItemListView: View {
    var name: String = ""
    var category: String = ""
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(){
            
            if(colorScheme == .dark){
                VStack(alignment: .leading){
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(category)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }else{
                VStack(alignment: .leading){
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(category)
                        .font(.caption)
                        .foregroundColor(.black)
                }
                
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
