//
//  TermsView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import SwiftUI

struct TermsView: View {
    
    @EnvironmentObject private var termsViewModel: TermsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
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
                
                termsList
                
                Spacer()
                
                Text("다음")
                    .frame(width: 300, height: 96)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.mainPurpleColor)
                    .foregroundColor(.theme.whiteColor)
                    .font(.appleSDGothicNeo(.regular, size: 20))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.theme.darkGreyColor)
                    }

                }
            }
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
            .environmentObject(dev.termsViewModel)
        
    }
}

// MARK: - COMPONENTS
extension TermsView {
    
    private var termsList: some View {
        VStack {
            TermsDetailView(terms: TermsModel(title: "전체동의", isSelected: false, isWhole: true, isNecessary: true), isChecked: $termsViewModel.isChecked, isCheckedWholeButton: $termsViewModel.isClickedWholeButton)
            
            Divider()
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
            
            ForEach(termsViewModel.termsList) { terms in
                TermsDetailView(terms: terms, isChecked: $termsViewModel.isChecked, isCheckedWholeButton: $termsViewModel.isClickedWholeButton)
                Spacer()
                    .frame(height: 15)
            }

        }
    }
}
