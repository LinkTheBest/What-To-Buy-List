//
//  ListNameView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 04.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI



struct ListNameView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State var list_name: String = ""
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Введите название списка:")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                HStack{
                    TextField(" Название...", text: self.$list_name)
                        .frame(width: 300, height: 45)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                NavigationLink(destination: MainListView(list_name: self.list_name)){
                    Image(systemName: "arrow.right.circle")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.green)
                }
                
            }.offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
            
        }.navigationBarBackButtonHidden(true)
            .offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
            .navigationBarTitle(Text(""))
            .navigationBarHidden(true)
            .offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
                keyWindow!.endEditing(true)        
        }
    }
}

struct ListNameView_Previews: PreviewProvider {
    static var previews: some View {
        ListNameView()
    }
}
