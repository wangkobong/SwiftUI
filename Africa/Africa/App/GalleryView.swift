//
//  GalleryView.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/16.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - PROPERTIES
  
  // MARK: - BODY
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        
      } //: SCROLL
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
