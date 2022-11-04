//
//  SpacerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/04.
//

import SwiftUI

struct SpacerBootcamp: View {
    /*
     Spacer는 프레임 내에서 가능한 한 크게 크기를 조정
     모든 스페이서의 크기가 자동으로 같은 크기로 조정됨
     
     */
    var body: some View {
//        HStack(spacing: 0) {
//
//            Spacer(minLength: 0)
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//            Rectangle()
//                .fill(.green)
//                .frame(width: 50, height: 50)
//
//            Spacer()
//                .frame(height: 10)
//                .background(.orange)
//
//        }
//        .background(.yellow)
//        .padding(.horizontal, 200)
//        .background(.blue)
        
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Image(systemName: "gear")
             
            }
            .font(.title)
            //.background(.yellow)
            .padding(.horizontal)
            //.background(.blue)
            
            Spacer()
                .frame(width: 10)
                .background(.orange)
        }
    }
        
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
