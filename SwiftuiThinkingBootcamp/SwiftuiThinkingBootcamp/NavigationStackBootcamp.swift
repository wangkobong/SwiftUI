//
//  NavigationStackBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/06/07.
//

import SwiftUI

struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple, Orange, Banana"]
    
    @State private var stackPath: [String] = []
    var body: some View {
        
        NavigationStack(path: $stackPath) {
            VStack {
                ScrollView {
                    
                    Button("Super segue!") {
                        stackPath.append(contentsOf: [
                            "Coconut", "Watermelon", "Mango"
                        ])
                    }
                    
                    VStack(spacing: 40) {
                        ForEach(fruits, id: \.self) { fruit in
                            
                            NavigationLink(value: fruit) {
                                Text(fruit)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("ANOTHER SCREEN: \(value)")
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT FOR SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}
