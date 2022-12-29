//
//  ListView.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/28.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem(indexSet:))
            .onMove(perform: listViewModel.moveItem(from:to:))
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
        .environmentObject(ListViewModel())
    }
}



