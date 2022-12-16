//
//  IfLetGuardBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/12/16.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserId: String? = "testuser123"
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding!")
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                Text(displayText ?? "no text")
                    .font(.title)
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        
        if let userID = currentUserId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                displayText = "This is the new Data! User id is: \(userID)"
                isLoading = false
            })
        } else {
            displayText = "Error. There is no User ID!"
        }
        
    }
    
    func loadData2() {
        guard let userID = currentUserId else {
            displayText = "Error. There is no User ID!"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            displayText = "This is the new Data! User id is: \(userID)"
            isLoading = false
        })
        
    }
}

struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
