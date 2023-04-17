//
//  AuthenticationView.swift
//  SwiftuiFirebaseBootcamp
//
//  Created by sungyeon kim on 2023/04/20.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    @Published var didSignInWithApple: Bool = false
    let signInAppleHelper = SignInAppleHelper()
    
    func signInGoogle() async throws {
        
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        
    }
    
    func signInApple() async throws {
        signInAppleHelper.startSignInWithAppleFlow { [weak self] result in
            switch result {
            case .success(let signInAppleResult):
                
                Task {
                    do {
                        try await AuthenticationManager.shared.signInWithApple(tokens: signInAppleResult)
                    } catch {
            
                    }
                }
                self?.didSignInWithApple = true
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .standard, state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        print("구글로그인 성공")
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button {
      
                Task {
                    do {
                        try await viewModel.signInApple()
//                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }

            } label: {
                SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                    .allowsTightening(false)
               
            }
            .frame(height: 55)
            .onChange(of: viewModel.didSignInWithApple) { newValue in
                if newValue {
                    showSignInView = false
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In")
            
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignInView: .constant(false))
        }
    }
}
