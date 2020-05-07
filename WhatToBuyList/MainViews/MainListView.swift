//
//  MainListView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 05.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct MainListView: View {
    
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ElementProperties.getAllElements()) var Elements: FetchedResults
    
    var body: some View {
        VStack(){
            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(self.Elements){
                        element in
                        ScrollViewElementModel(name: element.name!, category: element.category!)
                            .frame(width:UIScreen.main.bounds.size.width )
                        
                    }
                    
                }
            }
            
            HStack(){
                NavigationLink(destination: DeclarationView()){
                    Text("Добавить")
                        .frame(width:80, height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 0.5))
                }
                .padding()
                
                Button(action:{
                    for i in self.Elements{
                        self.managedObjectContext.delete(i)
                    }
                    self.mode.wrappedValue.dismiss()
                }){
                    Text("Очистить")
                        .frame(width:80, height: 45)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 0.5))
                }
                .padding()
            }
        }
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
        .navigationBarTitle(Text("Ваш список:"))
        .navigationBarBackButtonHidden(true)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
