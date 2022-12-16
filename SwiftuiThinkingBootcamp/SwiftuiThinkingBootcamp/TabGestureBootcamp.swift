//
//  TabGestureBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/12/16.
//

import SwiftUI

struct TabGestureBootcamp: View {
    
    @State var isSelected: Bool = false
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            Text("TAP GESTURE")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 5) {
                    isSelected.toggle()
                }
            
            Spacer()

        }
        .padding(40)
    }
}

struct TabGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabGestureBootcamp()
    }
}
