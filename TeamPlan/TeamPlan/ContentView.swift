////
////  ContentView.swift
////  TeamPlan
////
////  Created by sungyeon kim on 2023/02/05.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var isLoading = false
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            Image("loadingView_image")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Spacer()
//            
//            VStack(spacing: 40) {
//                
//                if isLoading {
//                    LoadingView()
//                }
//                
//                Text("TEAMPLAN")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.bottom)
//            }
//        }
//        .onAppear { startFakeNetworkCall() }
// 
//    }
//    
//    func startFakeNetworkCall() {
//        isLoading = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            isLoading = false
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//struct LoadingView: View {
//    var body: some View {
//        ZStack {
//            Color(.systemBackground)
//                .ignoresSafeArea()
//            
//            ProgressView()
//                .progressViewStyle(CircularProgressViewStyle())
//                .scaleEffect(3)
//        }
//    }
//}
