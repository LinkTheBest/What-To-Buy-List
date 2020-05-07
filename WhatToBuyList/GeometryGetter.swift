//
//  GeometryGetter.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 13.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import SwiftUI
struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}
