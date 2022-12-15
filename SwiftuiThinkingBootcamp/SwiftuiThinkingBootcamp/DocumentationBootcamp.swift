//
//  DocumentationBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/12/15.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: - PROPERTIES
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    @State var showAlert: Bool = false
    
    // MARK: - BODY
    
    // Working copy - things to do
    //  1) Fix title
    //  2)
    /*
     
     
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .navigationBarItems(trailing:
                                        Button("ALERT", action: {
                                            showAlert.toggle()
                                        })
                )
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is the alert")
                }
            } //: ZSTACK
        } // END: NAV
    }
    
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLVIEW
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLVIEW
    }
    
    // MARK: - FUNCTIONS
    
    /// Gets an alert with a specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter but it will NoT have a message.
    /// ```
    /// getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    /// ```
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns al alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }

}
    
    // MARK: - PREVIEW

struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
