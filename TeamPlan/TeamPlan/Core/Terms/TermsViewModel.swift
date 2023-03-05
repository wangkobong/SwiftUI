//
//  TermsViewModel.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/04.
//

import Foundation
import Combine

final class TermsViewModel: ObservableObject {
    
    @Published var termsList: [TermsModel] = []
    @Published var isClickedWholeButton: Bool = false
    @Published var isChecked: Bool = false

    private let termsDataService = TermsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        termsDataService.$termsList
            .sink { [weak self] termsList in
                self?.termsList = termsList
            }
            .store(in: &cancellables)
        
        $isChecked
            .sink { isClicked in
                print(isClicked)
            }
            .store(in: &cancellables)
    }
}
