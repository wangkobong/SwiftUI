//
//  HashableBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/04.
//

import SwiftUI

// 해쉬모델이 없으므로 에러가 난다
struct MyCustomModel: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
    
}

struct HashableBootcamp: View {
    
    // 문자열이 Hashable 프로토콜을 준수함
    // 각각의 문자에 uuid 존재
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subtitle: "1"),
        MyCustomModel(title: "TWO", subtitle: "2"),
        MyCustomModel(title: "THREE", subtitle: "3"),
        MyCustomModel(title: "FOUR", subtitle: "4"),
        MyCustomModel(title: "FIVE", subtitle: "5"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                ForEach(data) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
                ForEach(data, id: \.self) { item in
                    Text("\(item.hashValue.description)")
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
