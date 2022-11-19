//
//  AnimationBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/19.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isAnimated.description)") {
                withAnimation(
//                    .default
//                    .repeatCount(5, autoreverses: true)
                ) {
                    isAnimated.toggle()
                }
                
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? .red : .green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
                .animation(
                    .default
                    .repeatCount(5, autoreverses: true)
                )
            
            Spacer()
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
