//
//  SettingsView.swift
//  Fructus
//
//  Created by sungyeon kim on 2022/04/13.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - BODY
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            // MARK: - SECTION 1
            
            GroupBox(
              label:
                SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            ) {
              Divider().padding(.vertical, 4)
              
              HStack(alignment: .center, spacing: 10) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(9)
                
                Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                  .font(.footnote)
              }
            }
            
            // MARK: - SECTION 2
            
            // MARK: - SECTION 3
   
          } //: VSTACK
          .navigationTitle("Settings")
          .navigationBarItems(
            trailing:
              Button(action: {
                presentationMode.wrappedValue.dismiss()
              }) {
                Image(systemName: "xmark")
              }
          )
          .padding()
          
        } //: SCROLL
      } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12 Pro Max")
    }
}
