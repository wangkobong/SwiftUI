//
//  ListView.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/28.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "출근하기", isCompleted: true),
        ItemModel(title: "헬스장가기", isCompleted: false),
        ItemModel(title: "코딩하기", isCompleted: true),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 🖥️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: {
                    AddView()
                })
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}



