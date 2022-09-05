//
//  Dish.swift
//  HelloState
//
//  Created by sungyeon kim on 2022/09/06.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool
}

extension Dish {
    static func all() -> [Dish] {
        return [
            Dish(name: "chicken", imageURL: "kungpow", isSpicy: true),
            Dish(name: "beef", imageURL: "sweet", isSpicy: false),
            Dish(name: "pork", imageURL: "spicy", isSpicy: false)
        ]
    }
}
