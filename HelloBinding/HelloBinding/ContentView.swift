//
//  ContentView.swift
//  HelloBinding
//
//  Created by sungyeon kim on 2022/09/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "Hello"
    
    private func printName() {
        print(name)
    }
    
    var body: some View {
        VStack {
            Text(name)
            TextField("Enter Name", text: $name)
                .padding(12)
            
            Button {
               printName()
            } label: {
                Text("Show Name Value")
            }

        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
