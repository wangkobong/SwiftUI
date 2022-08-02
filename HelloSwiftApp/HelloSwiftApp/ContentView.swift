//
//  ContentView.swift
//  HelloSwiftApp
//
//  Created by sungyeon kim on 2022/08/01.
//

import SwiftUI

// View는 UI를 구성하는 가장 기본적인 요소
// 스유에서는 크게 두가지 역할을 담당
// 1. 화면에서 특정부분에 원하는 데이터나 상태를 표시
// 2. 여러개의 뷰가 모여서 하나의 화면을 구성하기도 한다.
// 스유에서는 View를 배치할 때 기본적으로 센터에 배치함
struct ContentView: View {
    //@State 속성이 변경하게 되면 View 렌더링을 다시 함
    @State var data: String = "0"
    // body속성에서는 반드시 하나의 View만 리턴해야함
    // 두개이상의 View로 구성하려면 스택이나 그룹 네비게이션뷰 등으로 감싸야함.
    var body: some View {
        
        // 모든 모디파이어는 뷰를 리턴하는 특별한 메서드
        // 뷰 프로토콜을 통해서 다양한 모디파이어를 제공함
        VStack {
            Text(data)
                .bold()
                .font(.largeTitle)
            
            Button {
                data = "\(Int.random(in: 1...100))"
            } label: {
                Text("Update")
            }
            .font(.subheadline)
            
        }
        .padding()
        .onAppear {
            print("onApper")
        }
        .onDisappear {
            print("onDisapppear")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
