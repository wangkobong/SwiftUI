//
//  IconsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/01.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .scaledToFit()
            .scaledToFill()
            //.font(.caption)
            //.font(.system(size: 200))
            .foregroundColor(.red)
            .frame(width: 300, height: 300) // 아이콘 크기는 조정안됨
            //.clipped() // 프레임 넘어가면 잘림
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
