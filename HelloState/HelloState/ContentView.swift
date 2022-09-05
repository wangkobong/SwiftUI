//
//  ContentView.swift
//  HelloState
//
//  Created by sungyeon kim on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = "John"
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
            
            Button {
                name = "Mary"
            } label: {
                Text("Change Name")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
