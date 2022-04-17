//
//  ContentView.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/16.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  // MARK: - BODY
    var body: some View {
      NavigationView {
        List {
          CoverImageView()
            .frame(height: 300)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        } //: LIST
        .navigationTitle("Africe")
        .navigationBarTitleDisplayMode(.large)
      } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
