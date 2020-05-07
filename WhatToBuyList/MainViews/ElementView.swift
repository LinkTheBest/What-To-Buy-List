//
//  ElementDeclaration.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 06.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct DeclarationView: View {
    @State private var isAlert = false
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @FetchRequest(fetchRequest: ElementProperties.getAllElements()) var Elements: FetchedResults
    private let categories = ["Продукты","Медикаменты"]
    @State private var selectedCategory = 0
    @State var name:String = ""
    @State var category:String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                
                Text("Добавьте элемент в список")
                    .font(.title)
                    .frame(width: UIScreen.main.bounds.size.width, height: 20, alignment: .center)
                    .padding()
                TextField(" Название...", text: self.$name)
                    .frame(width:UIScreen.main.bounds.size.width, height: 45)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                
                VStack(alignment: .center){
                    Picker(selection: $selectedCategory, label: Text("")) {
                        ForEach(0 ..< categories.count) {
                            Text(self.categories[$0]).tag($0)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                }
                
                Button(action:{
                    let name = self.name
                    let category = self.categories[self.selectedCategory]
                    if(name.isEmpty){
                        self.isAlert.toggle()
                    }
                    let elementProperties = ElementProperties(context: self.managedObjectContext)
                    elementProperties.name = name
                    elementProperties.category = category
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print(error)
                    }
                    self.name = ""
                    self.category = ""
                    self.mode.wrappedValue.dismiss()
                }){
                    Text("Готово!")
                }.alert(isPresented: $isAlert){
                    Alert(title: Text("The name"), message: Text("Enter the name and category!"), dismissButton: .default(Text("Got it!")){
                        let item = self.Elements[0]
                        self.managedObjectContext.delete(item)
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                        })
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.blue,lineWidth: 1))
                Spacer()
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
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
    }
}


struct DeclarationView_Previews: PreviewProvider {
    static var previews: some View {
        DeclarationView()
    }
}

