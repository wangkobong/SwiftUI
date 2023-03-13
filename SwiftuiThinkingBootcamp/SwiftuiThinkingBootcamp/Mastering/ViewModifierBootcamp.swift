//
//  ViewModifierBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/03/17.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    // 뷰모디파이어에는 패딩을 넣으며 좋지 않다. 각 화면마다 다를 수 있기 때문!
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .black) -> some View {
        self
            .modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
 
    var body: some View {
        VStack {
            Text("Hello, world!")
                .withDefaultButtonFormatting(backgroundColor: .green)
            
            Text("Hello, world!2")
                .withDefaultButtonFormatting()
            
            Text("Hello, world!3")
                .modifier(DefaultButtonViewModifier(backgroundColor: .blue))
        }
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
