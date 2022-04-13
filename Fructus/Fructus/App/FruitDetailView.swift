//
//  FruitDetailView.swift
//  Fructus
//
//  Created by sungyeon kim on 2022/04/12.
//

import SwiftUI

struct FruitDetailView: View {
  
  // MARK: - PROPERTIES
  
  var fruit: Fruit
  
  // MARK: - BODY
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center, spacing: 20) {
            // HEADER
            FruitHeaderView(fruit: fruit)
            
            VStack(alignment: .leading, spacing: 20) {
              // TITLE
              Text(fruit.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(fruit.gradientColors[1])
              
              // HEADLINE
              Text(fruit.headline)
                .font(.headline)
                .multilineTextAlignment(.leading)
          
              // NUTRIENTS
              FruitNutrientsView(fruit: fruit)
              
              
              // SUBHEADLINE
              Text("Learn more about \(fruit.title)".uppercased())
                .fontWeight(.bold)
                .foregroundColor(fruit.gradientColors[1])

              // DESCRIPTION
              Text(fruit.description)
                .multilineTextAlignment(.leading)
              
              // LINK
              SourceLinkView()
                .padding(.top, 10)
                .padding(.bottom, 40)
              
              
            } //: VSTACK
            .padding(.horizontal, 20)
            .frame(maxWidth: 640, alignment: .center)
          } //: VSTACK
          .navigationTitle(fruit.title)
          .navigationBarTitleDisplayMode(.inline)
          .navigationBarHidden(true)  // 제목영역에 생긴 공백을 메꾸기 위한 트릭
        } //: SCROLL
        
        .edgesIgnoringSafeArea(.top) //세이프에어리어 채우기
      } //: NAVIGATION
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
        .previewDevice("iPhone 12 Pro Max")
    }
}
