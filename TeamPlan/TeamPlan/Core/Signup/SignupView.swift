//
//  SignupView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/14.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var signupState: Int = 0
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))

    // onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    

    var body: some View {
        NavigationView {

            VStack {
                
                Spacer()
                    .frame(height: 34)

                levelBar


                
                Spacer()
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}


extension SignupView {
    
    private var levelBar: some View {
        
        HStack(spacing: 3) {
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(Color.theme.mainBlueColor)
                    .frame(width: 87, height: 5)
                    .cornerRadius(4)
                 
            }
        }
        .padding(.horizontal, 5)
        .frame(height: 5)
    }
}
