//
//  TermsDataService.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import Foundation
import Combine

final class TermsDataService {
    
    @Published var termsList: [TermsModel] = []
    var terms: AnyCancellable?
    
    init() {
        getTerms()
    }
    
    func getTerms() {
        // 나중에 이곳에서 fetch terms
        
        let termsDataFromServer: [TermsModel] = [
            TermsModel(title: "서비스 이용약관 동의", isSelected: false, isNecessary: true),
            TermsModel(title: "개인정보 수집 및 이용 동의", isSelected: false, isNecessary: true),
            TermsModel(title: "마케팅 활용/광고성 정보 수신 동의", isSelected: false, isNecessary: false),
        ]
        self.termsList = termsDataFromServer
    }
}

