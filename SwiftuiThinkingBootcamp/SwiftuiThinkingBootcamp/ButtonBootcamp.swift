//
//  ButtonBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/14.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State private var title: String = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(title)
            Button("Press me!") {
                title = "BUTTON WAS PRESSED"
            }
            .tint(.red)
            
            Button {
                self.title = "Button #2 was pressed"
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            
            Button {
                self.title = "Button #3"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    }
            }
            
            Button {
                self.title = "Button #4"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .strokeBorder(.gray, lineWidth: 2.0)
                    )
            }



        }
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
