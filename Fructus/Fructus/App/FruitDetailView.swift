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
      Text(fruit.title)
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
        .previewDevice("iPhone 12 Pro Max")
    }
}
