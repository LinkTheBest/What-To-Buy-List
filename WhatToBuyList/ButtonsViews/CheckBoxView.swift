//
//  CheckBoxView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct CheckBoxView: View {
    @State private var isChecked: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    func getCheckMarkState()->Bool{
        return isChecked
    }
    
    var body: some View {
        VStack(alignment: .center){
            ZStack(alignment: .top){
                Button(action:{
                    self.isChecked.toggle()
                }){
                    if(colorScheme == .dark ){
                        Image(systemName: self.isChecked ? "checkmark.circle.fill" : "circle.fill")
                            .resizable()
                            .frame(width:30 ,height:30 )
                            .padding()
                            .foregroundColor(.white)
                    } else{
                        Image(systemName: self.isChecked ? "checkmark.circle" : "circle")
                            .resizable()
                            .frame(width:30 ,height:30 )
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView()
    }
}
