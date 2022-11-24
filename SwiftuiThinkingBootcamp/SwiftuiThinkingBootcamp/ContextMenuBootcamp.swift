//
//  ContextMenuBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/25.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor).cornerRadius(30)
        .contextMenu {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Share post", systemImage: "flame.fill")
            }
            
            Button {
                backgroundColor = .red
            } label: {
                Text("Report post")
            }
            
            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                }
            }


        }
            
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
