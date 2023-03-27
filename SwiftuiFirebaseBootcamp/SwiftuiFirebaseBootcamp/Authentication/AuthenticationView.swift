//
//  AuthenticationView.swift
//  SwiftuiFirebaseBootcamp
//
//  Created by sungyeon kim on 2023/04/20.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                Text("Hello")
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
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
            AuthenticationView()
        }
    }
}