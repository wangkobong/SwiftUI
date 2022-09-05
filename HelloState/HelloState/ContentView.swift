//
//  ContentView.swift
//  HelloState
//
//  Created by sungyeon kim on 2022/09/05.
//

import SwiftUI

struct ContentView: View {

    
    @State var tasks = [Task]()
    
    private func addTask() {
        tasks.append(Task(name: "take a shower"))
    }
    
    var body: some View {
        List {
            Button {
                addTask()
            } label: {
                Text("Add Tasks")
            }

            ForEach(tasks) { task in
                Text(task.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
