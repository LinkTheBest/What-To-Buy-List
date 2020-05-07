//
//  ListName.swift
//  WhatToBuyList
//
//  Created by Никита Попов on 29.03.2020.
//  Copyright © 2020 Никита Попов. All rights reserved.
//

import CoreData
import SwiftUI

public class ListName: NSManagedObject, Identifiable{
    @NSManaged public var name: String?
}
