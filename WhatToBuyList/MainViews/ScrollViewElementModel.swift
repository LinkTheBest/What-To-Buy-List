//
//  ScrollViewElementModel.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct ScrollViewElementModel: View {
    
    var name: String?
    var category: String?
    @State var isChecked = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(){
                CheckMarkView(isChecked: $isChecked)
                if(isChecked){
                    NavigationLink(destination: ItemDescription(name: name ?? "", category: category ?? "")){
                        ItemListView(name: name ?? "", category: category ?? "")
                    }
                    BoughtProductView()
                        .animation(.spring())
                }else{
                    NavigationLink(destination: ItemDescription(name: name ?? "", category: category ?? "")){
                        ItemListView(name: name ?? "", category: category ?? "")
                    }
                }
                Spacer()
            }
            
            
        }
    }
}


struct ScrollViewElementModel_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewElementModel()
    }
}
