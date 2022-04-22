//
//  CenterModifier.swift
//  Africa
//
//  Created by sungyeon kim on 2022/04/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
