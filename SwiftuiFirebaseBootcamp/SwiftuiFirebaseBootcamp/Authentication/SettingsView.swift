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
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        
        let email = "test123@gmail.com"

        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        
        let password = "hello1234"

        try await AuthenticationManager.shared.updatePassword(password: password)
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
            
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Reset Password")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Reset Password")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Update Password")
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Update Email")
                    } catch {
                        print(error.localizedDescription)
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
