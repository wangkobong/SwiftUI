//
//  SafeAreaBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/11.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        
        ZStack {
          
            
            ScrollView {
                VStack {
                    Text("Title goes here")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(height: 150)
                            .shadow(radius: 10)
                            .padding(20)
                    }
                }
            }
//            .background(.blue)
            .background(
                Color.red
                    .edgesIgnoringSafeArea(.all)
            )
            
        }
       
//        ZStack {
//            // background
//            Color.blue
//                .edgesIgnoringSafeArea(.all)
//
//            // foreground
//            VStack {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
//        }
    }
}

struct SafeAreaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBootcamp()
    }
}
