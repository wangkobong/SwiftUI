//
//  PageTabViewStyleBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/12/13.
//

import SwiftUI

struct PageTabViewStyleBootcamp: View {
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]
    var body: some View {
        
        TabView {
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundColor(.red)
//            RoundedRectangle(cornerRadius: 25.0)
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundColor(.green)
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())

//        TabView(selection: $selectedTab) {
//
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//
//            Text("BROWSE TAB")
//                .tabItem {
//                    Image(systemName: "globe")
//                    Text("Browse")
//                }
//                .tag(1)
//
//            Text("PROFILE TAB")
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//                .tag(2)
//        }
    }
}

struct PageTabViewStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PageTabViewStyleBootcamp()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
