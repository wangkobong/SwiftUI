//
//  ContentView.swift
//  iDine
//
//  Created by sungyeon kim on 2022/08/13.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu, id: \.id) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    } //: FOREACH
                }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
            }//: LIST
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
