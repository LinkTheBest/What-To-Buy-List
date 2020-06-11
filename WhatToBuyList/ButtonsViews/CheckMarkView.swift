//
//  CheckMarkView.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 07.05.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI

struct CheckMarkView: View {
    
    @Binding var isChecked: Bool
    @Environment(\.colorScheme) var colorScheme
    
    func getCheckMarkState()->Bool{
        return isChecked
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(){
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

//struct CheckMarkView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckMarkView(isChecked: true)
//    }
//}
