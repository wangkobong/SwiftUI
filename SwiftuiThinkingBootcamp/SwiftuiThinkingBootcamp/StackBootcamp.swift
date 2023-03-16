//
//  StackBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/06.
//

import SwiftUI

struct StackBootcamp: View {
    
    // Vstack -> Vertical
    
    // Hstack -> Horizontal
    
    // Zstack -> zIndex (back to front)
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                
                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
        
//        VStack(alignment: .center, spacing: 20) {
//
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//
//            Text("Items in your cart")
//                .font(.caption)
//                .foregroundColor(.gray)
//
//        }
        
//        ZStack {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500, alignment: .center)
//
//            VStack {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150, alignment: .center)
//
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100, height: 100, alignment: .center)
//
//                HStack {
//                    Rectangle()
//                        .fill(.purple)
//                    .frame(width: 50, height: 50)
//
//                    Rectangle()
//                        .fill(.pink)
//                        .frame(width: 75, height: 75)
//
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 25, height: 25)
//                }
//                .background(.white)
//            }
//            .background(.black)
//        }
        
        HStack(alignment: .center, spacing: 8) {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)

            Rectangle()
                .fill(.green)
                .frame(width: 150, height: 150)

            Rectangle()
                .fill(.orange)
                .frame(width: 100, height: 100)
        }
//        VStack() {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//        }
    }
}

struct StackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StackBootcamp()
    }
}
