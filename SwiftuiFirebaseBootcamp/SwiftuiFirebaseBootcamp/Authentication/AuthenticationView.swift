//
//  AuthenticationView.swift
//  SwiftuiFirebaseBootcamp
//
//  Created by sungyeon kim on 2023/04/20.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

final class AuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        
//        let something = GIDSignIn.sharedInstance.signIn(withPresenting: <#T##UIViewController#>)
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
