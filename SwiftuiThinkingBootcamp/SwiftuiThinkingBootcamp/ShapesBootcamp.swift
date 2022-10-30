//
//  ShapesBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/10/31.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
       // Circle()
            //.fill(.green)
//            .foregroundColor(.green)
            //.stroke(.red)
            //.stroke(.blue, lineWidth: 30)
//            .stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round, dash: [30]))
//            .trim(from: 0.2, to: 1.0)
//            .stroke(.purple, lineWidth: 5)
//        Ellipse()
//            .trim(from: 0.2, to: 1.0)
//            .frame(width: 200, height: 100)
//        Capsule(style: .continuous)
//            .fill(.green)
//            .stroke(.purple, lineWidth: 30)
//            .frame(width: 200, height: 100)
        RoundedRectangle(cornerRadius: 50)
            .frame(width: 300, height: 200)
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
