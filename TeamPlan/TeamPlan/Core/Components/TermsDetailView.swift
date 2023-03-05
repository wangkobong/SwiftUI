//
//  TermsDetailView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import SwiftUI

struct TermsDetailView: View {
    
    let terms: TermsModel
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image("Check")
                }

                Text(terms.title)
                    .foregroundColor(Color(hex: "4B4B4B"))
                    .font(.appleSDGothicNeo(.regular, size: 18))
                Text(terms.isNecessary ? "(필수)" : "(선택)")
                    .opacity(terms.isWhole ? 0.0 : 1.0)
                    .foregroundColor(terms.isNecessary ? .theme.mainBlueColor : Color(hex: "4B4B4B"))
                    .font(.appleSDGothicNeo(.bold, size: 16))
                
                Spacer()
            }
            .padding(.horizontal, 26)
            
        }
    }
}

struct TermsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TermsDetailView(terms: TermsModel(title: "서비스 이용약관 동의", isSelected: false, isNecessary: true))
            //.previewLayout(.sizeThatFits)
    }
}
