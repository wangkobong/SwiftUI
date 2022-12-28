//
//  ItemModel.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/29.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
