//
//  Item.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
