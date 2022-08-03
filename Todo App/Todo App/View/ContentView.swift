//
//  ContentView.swift
//  Todo App
//
//  Created by sungyeon kim on 2022/08/03.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
//    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)])
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello, World!")
            } //: LIST
            .navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    // Show add todo view
                    self.showingAddTodoView.toggle()
                } label: {
                    Image(systemName: "plus")
                } //: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
                }
            }
        } //: NAVIGATION
    }

}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
