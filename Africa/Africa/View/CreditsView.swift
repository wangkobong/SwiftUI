//
//  CreditsView.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
      VStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width:128, height: 128)
        
        Text("""
  Copyright @ wangkobong
  All right reserved
  Better Apps ♡ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
      } //: VSTACK
      .padding()
      .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
