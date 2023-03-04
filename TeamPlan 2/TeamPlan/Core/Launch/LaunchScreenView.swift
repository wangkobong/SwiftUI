////
////  LaunchScreenView.swift
////  TeamPlan
////
////  Created by sungyeon kim on 2023/02/05.
////
//
//import SwiftUI
//import Combine
//
//
//struct LaunchScreenView: View {
//
//    @State private var loadingText: [String] = "loading...".map { String($0) }
//    @State private var showLoadingText: Bool = false
//    @State private var counter: Int = 0
//    @State private var loops: Int = 0
//    @State private var percent: CGFloat = 0
//    @Binding var showOnboardingView: Bool
//    
//    
//    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//    let timer2 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            Image("loadingView_image")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            VStack {
//                CustomProgressView(percent: $percent)
//                    .padding(.leading)
//                    .padding(.trailing)
//                
//                if showLoadingText {
//                    HStack(spacing: 0) {
//                        ForEach(loadingText.indices, id: \.self) { index in
//                            Text(loadingText[index])
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .padding(.bottom)
//                                .offset(y: counter == index ? -5 : 0)
//                        }
//                    }
//                    .transition(AnyTransition.scale.animation(.easeIn))
//                }
//            }
//            Spacer()
//            
//            VStack(spacing: 40) {
//                
//
//            }
//        }
//        .onAppear { showLoadingText.toggle() }
//        .onReceive(timer, perform: { _ in
//            withAnimation(.spring()) {
//                
//                let lastIndex = loadingText.count - 1
//                if counter == lastIndex {
//                    counter = 0
//                    loops += 1
//                    if loops >= 3 {
//                        showOnboardingView = false
//                    }
//                } else {
//                    counter += 1
//                }
//            }
//        })
//        .onReceive(timer2, perform: { _ in
//            withAnimation(.spring()) {
//                if percent < 1.0 {
//                    percent += 0.25
//                }
//            }
//        })
//    }
//    
////    func startFakeNetworkCall() {
////        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////            isActive = true
////        }
////    }
//}
//
//struct LaunchScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchScreenView(showOnboardingView: .constant(true))
//    }
//}
//
//struct CustomProgressView: View {
//    
//    @Binding var percent: CGFloat
//    var body: some View {
//        ZStack(alignment: .leading) {
//            
//            ZStack(alignment: .trailing) {
//                Capsule()
//                    .fill(.black.opacity(0.08))
//                    .frame(height: 10)
////                Text(String(format: "%.0f", percent * 100) + "%")
////                    .font(.caption)
////                    .foregroundColor(.green.opacity(0.75))
////                    .padding(.leading)
//            }
//            Capsule()
//                .fill(
//                    LinearGradient(gradient: Gradient(colors: [Color("progress_1"), Color("progress_2")]), startPoint: .leading, endPoint: .trailing)
//                )
//                .frame(width: calPercent(), height: 12)
//        }
//    }
//    
//    func calPercent() -> CGFloat {
//        //let width = UIScreen.main.bounds.width - 18 - 18 - 15 - 15
//        let width = UIScreen.main.bounds.width - 18 - 18
//        print(UIScreen.main.bounds.width)
//        print(width * percent)
//        return width * percent
//    }
//    
//}
