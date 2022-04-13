//
//  ContentView.swift
//  Fructus
//
//  Created by sungyeon kim on 2022/04/10.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @State private var isShowingSettings: Bool = false
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - BODY
  
    var body: some View {
      NavigationView {
        List {
          ForEach(fruits.shuffled()) { item in
            // didSelectRowAt과 같은 포지션
            NavigationLink(destination: FruitDetailView(fruit: item)) {
              FruitRowView(fruit: item)
                .padding(.vertical, 4)
            }
          }
        }
        .navigationTitle("Fruits")
        .navigationBarItems(
          trailing:
            Button(action: {
              isShowingSettings = true
            }) {
              Image(systemName: "slider.horizontal.3")
            } //: BUTTON
            .sheet(isPresented: $isShowingSettings) {
              SettingsView()
            }
        )
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}