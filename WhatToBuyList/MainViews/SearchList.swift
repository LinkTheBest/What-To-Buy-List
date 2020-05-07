//
//  SearchList.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 03.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct SearchList: View {
    private var searchWord: String = " "
    private var map = MapView()
    
    
    var body: some View {
        
        VStack(){
            List{
                for str in map.getLocalShops(){
                    Text(str)
                }
            }
        }
    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}
