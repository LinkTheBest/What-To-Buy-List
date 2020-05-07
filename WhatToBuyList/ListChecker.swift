//
//  ListChecker.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 29.03.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import CoreData
import SwiftUI

public class ListChecker{
    @FetchRequest(fetchRequest: ElementProperties.getAllElements()) var Elements: FetchedResults
    func check()->Bool{
        var count = 0
        for i in Elements{
            count+=1
        }
        if(count == 0){
            return true
        }else {return false}
    }
}
