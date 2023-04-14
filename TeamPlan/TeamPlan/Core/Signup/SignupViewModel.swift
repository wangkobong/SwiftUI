//
//  SignupViewModel.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/05/21.
//

import Foundation
import Combine

final class SignupViewModel: ObservableObject {
    
    @Published var jobs: [SignupModel] = []
    @Published var interests: [SignupModel] = []
    @Published var abilities: [SignupModel] = []
    
    private let signupDataService = SignupDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        signupDataService.$jobs
            .sink { [weak self] jobs in
                self?.jobs = jobs
            }
            .store(in: &cancellables)
        
        signupDataService.$interests
            .sink { [weak self] interests in
                self?.interests = interests
            }
            .store(in: &cancellables)
        
        signupDataService.$abilities
            .sink { [weak self] abilities in
                self?.abilities = abilities
            }
            .store(in: &cancellables)
    }
    
}
