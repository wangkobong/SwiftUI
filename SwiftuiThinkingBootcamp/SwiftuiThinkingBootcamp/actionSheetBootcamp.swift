//
//  actionSheetBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/24.
//

import SwiftUI

struct actionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
                
                
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
            
        }
        .confirmationDialog("TITLE", isPresented: $showActionSheet, actions: {
            Button(role: .destructive) {
                
            } label: {
                Text("DESTRUCTIVE")
            }
            
            Button() {
                
            } label: {
                Text("DEFAULT")
            }

        }) {
            Text("This is the title!")
        }
        
        
    }
    
}
struct actionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        actionSheetBootcamp()
    }
}
