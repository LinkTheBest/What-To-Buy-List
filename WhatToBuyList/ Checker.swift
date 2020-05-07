//
//   Checker.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 22.03.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import CoreData



public class Checker{
    @FetchRequest(fetchRequest: ElementProperties.getAllElements()) var Elements: FetchedResults
    var isEmpty: Bool {
        do {
            var count = 0
            for _ in Elements{
                count = count + 1
            }
            if (count == 0 ){
                return false
            } else{
                return true
            }
        } catch {
            return true
        }
    }
}
