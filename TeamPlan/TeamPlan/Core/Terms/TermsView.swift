//
//  TermsView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import SwiftUI

struct TermsView: View {
    
    @EnvironmentObject private var termsViewModel: TermsViewModel
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            HStack {
                Text("이용약관 동의가 필요해요!")
                    .foregroundColor(.theme.blackColor)
                    .font(.appleSDGothicNeo(.semiBold, size: 25))
                Spacer()
            }
            .padding(.horizontal, 16)
            
            Spacer()
                .frame(height: 85)
            
            ForEach(termsViewModel.termsList) { terms in
                TermsDetailView(terms: terms)
            }
            
            Spacer()
            
            Text("다음")
                .frame(width: 300, height: 96)
                .frame(maxWidth: .infinity)
                .background(Color.theme.mainPurpleColor)
                .foregroundColor(.theme.whiteColor)
                .font(.appleSDGothicNeo(.regular, size: 20))
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
            .environmentObject(dev.termsViewModel)
        
    }
}
