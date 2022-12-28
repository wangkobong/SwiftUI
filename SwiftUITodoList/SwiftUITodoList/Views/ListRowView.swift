//
//  ListRowView.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/28.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "shott", isCompleted: false))
    }
}
