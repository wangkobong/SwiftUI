//
//  NavigationModifier.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/15.
//

import SwiftUI

struct DefaultNavigationModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarHidden(true)
    }
}

extension View {
    
    func defaultNavigationMFormatting() -> some View {
        self
            .modifier(DefaultNavigationModifier())
    }
}
