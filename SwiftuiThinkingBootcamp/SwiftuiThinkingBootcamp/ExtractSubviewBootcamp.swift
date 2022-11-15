//
//  ExtractSubviewBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/11/16.
//

import SwiftUI

struct ExtractSubviewBootcamp: View {
    /*
        가변적인 뷰는 구조체를 통해 추출하고 재활용
        가변적이지 않은 뷰는 변수로 선언하고 활용
     
     */
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            

            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "bananas", count: 23, color: .yellow)
        }
    }
}

struct ExtractSubviewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewBootcamp()
    }
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text("\(title)")
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
