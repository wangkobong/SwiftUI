//
//  initAndEnumsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/07.
//

import SwiftUI

enum Fruits {
    case apple
    case orange
}

struct initAndEnumsBootcamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruits) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.title = "APPLES"
            self.backgroundColor = .red
        case .orange:
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct initAndEnumsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        initAndEnumsBootcamp(count: 30, fruit: .apple)
        initAndEnumsBootcamp(count: 46, fruit: .orange)
    }
}
