//
//  SettingsView.swift
//  SwiftuiFirebaseBootcamp
//
//  Created by sungyeon kim on 2023/05/11.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthenticationManager.shared.singOut()
    }
    
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}
