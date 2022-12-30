//
//  ItemModel.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/29.
//

import Foundation

/*
    CRUD FUNCTIONS
 
    Create
    Read
    Update
    Delete
 
 */

// Immutable Struct
struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


