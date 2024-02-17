//
//  Item.swift
//  VIHve Libre
//
//  Created by Ariel Merino on 17/01/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
