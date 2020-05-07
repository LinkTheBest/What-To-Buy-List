//
//  ContentView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 04.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var location = LocationManager()
    @FetchRequest(fetchRequest: ElementProperties.getAllElements()) var Elements: FetchedResults
    var isEmpty:Bool{
        var count = 0
        for _ in Elements{
            count += 1
        }
        if(count == 0){
            return true
        }else{return false}
    }
    var body: some View {
        NavigationView{
            if(isEmpty){}else{MainListView()}
            VStack(){
                Text("Начните добавлять что-то в свой список!")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: MainListView() ) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .foregroundColor(.green)
                        .frame(width: 45, height: 45)
                }
                //                .navigationBarHidden(self.isNavigationBarHidden)
                //                .onAppear {
                //                    self.isNavigationBarHidden = true
                //                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
