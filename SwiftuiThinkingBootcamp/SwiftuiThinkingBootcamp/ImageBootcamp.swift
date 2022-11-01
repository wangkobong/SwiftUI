//
//  ImageBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/02.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("fish")
            //.renderingMode(.template)
            .resizable()
            //.aspectRatio(contentMode: .fill)
            //.scaledToFit()
            .scaledToFill()
            .frame(width: 300, height: 300)
            //.clipped()
            //.cornerRadius(150)
            .clipShape(
                //Circle()
                RoundedRectangle(cornerRadius: 25.0)
            ) // 도형만들기
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
