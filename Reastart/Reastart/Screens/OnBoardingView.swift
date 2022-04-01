//
//  OnBoardingView.swift
//  Reastart
//
//  Created by sungyeon kim on 2022/04/02.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
               isOnboardingViewActive = false
            }) {
                Text("Start")
            }
        } //: VSTACK
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
