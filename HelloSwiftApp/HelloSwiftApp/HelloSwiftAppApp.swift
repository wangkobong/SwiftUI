//
//  HelloSwiftAppApp.swift
//  HelloSwiftApp
//
//  Created by sungyeon kim on 2022/08/01.
//

import SwiftUI

// @main 키워드를 통해서 컴파일러가 자동으로 main함수를 합성
// main함수는 앱 실행시 os가 가장먼저 실행하는 함수
// 초기화 과정 담당
@main
struct HelloSwiftAppApp: App {
    
    // body 속성에서 리턴하는 객체는 반드시 Scene 프로토콜을 구현해야함
    // WindowGroup == Scene
    // Scene은 뷰계층을 담고있는 컨테이너, 플랫폼과 현재 앱상태에따라 뷰계층을 표시하는 시점 표시하는 방식을 자동으로 결정
    var body: some Scene {
        MyScene()
    }
}

struct MyScene: Scene {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                
            }
        }
    }
}
