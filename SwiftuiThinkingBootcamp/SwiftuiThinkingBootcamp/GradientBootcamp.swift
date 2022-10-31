//
//  GradientBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/01.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.red
//                LinearGradient(
//                    colors: [.red, .blue, .green],
//                    startPoint: .leading,
//                    endPoint: .trailing
//
//                )
//                RadialGradient(
//                    gradient: Gradient(colors: [.red, .blue]),
//                    center: .center,
//                    startRadius: 5,
//                    endRadius: 200
//                )
                
                AngularGradient(
                    gradient: Gradient(colors: [.red, .blue]),
                    center: .center,
                    angle: .degrees(45)
                )
            )
            .frame(width: 300, height: 200)
            
    }
}

struct GradientBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientBootcamp()
    }
}
