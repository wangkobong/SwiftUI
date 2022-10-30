//
//  TextBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/10/29.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World! This is the Swiftful thinking Bootcamp. I am really enjoying this course learnging a lot. hahahahahahaha")
            //.font(.body)
            //.fontWeight(.semibold)
//            .bold()
            //.underline()
//            .underline(true, color: Color.red)
//            .italic()
//            .strikethrough(true, color: Color.green)
//            .font(.system(size: 24, weight: .semibold, design: .serif))
            //.baselineOffset(-50) // 상하 글자 간격
            //.kerning(10) // 좌우 글자 간격
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .center)
            .minimumScaleFactor(0.1)
        
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
