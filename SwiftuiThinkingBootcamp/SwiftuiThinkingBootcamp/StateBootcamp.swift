//
//  StateBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/15.
//

import SwiftUI

struct StateBootcamp: View {
    
    /*
        @state 변수가 변경되면 UI를 업데이트
        
     */
    @State private var backgroundColor: Color = .green
    @State private var myTitle: String = "My Title"
    @State private var count: Int = 0
    
    var body: some View {
        ZStack {
            // background
            
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        self.backgroundColor = .pink
                        myTitle = "BUTTON1 was pressed"
                        count += 1
                    }
                    
                    Button("BUTTON 2") {
                        self.backgroundColor = .orange
                        myTitle = "BUTTON2 was pressed"
                        count -= 1
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct StateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StateBootcamp()
    }
}
