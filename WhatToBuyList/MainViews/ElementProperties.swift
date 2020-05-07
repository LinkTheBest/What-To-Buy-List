//
//  ItemProperties.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 06.02.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import CoreData
import SwiftUI

public class ElementProperties: NSManagedObject, Identifiable{
    @NSManaged public var name: String?
    @NSManaged public var category: String?
}

extension ElementProperties{
    static func getAllElements()-> NSFetchRequest<ElementProperties>{
        let request: NSFetchRequest<ElementProperties> = NSFetchRequest<ElementProperties>(entityName: "ElementProperties")
        let sortDescriptor = NSSortDescriptor(key: "category", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }  
}
