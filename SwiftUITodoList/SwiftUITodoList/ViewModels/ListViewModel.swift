//
//  ListViewModel.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/30.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "출근하기", isCompleted: true),
            ItemModel(title: "헬스장가기", isCompleted: false),
            ItemModel(title: "코딩하기", isCompleted: true),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
