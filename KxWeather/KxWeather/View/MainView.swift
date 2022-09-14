//
//  MainView.swift
//  KxWeather
//
//  Created by sungyeon kim on 2022/09/14.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            GeometryReader { reader in
                Image("bkg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width)
                    .ignoresSafeArea()
                    .overlay {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                    }
            }
            
            VStack {
                Text("강남역")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                
                GeometryReader { reader in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Color.red
                            
                            Color.yellow
                                .frame(height: 200)
                            
                            
                        }//: VSTACK
                        .frame(height: reader.size.height)
                        
                        Spacer(minLength: reader.safeAreaInsets.bottom)
                            
                        
                        Color.green
                            .frame(height: 1000)
                    }
                }//: GeometryReader
            }//: VSTACK
        }//: ZSTACK
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
