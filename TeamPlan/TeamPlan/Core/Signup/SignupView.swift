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
    @State var nickname: String = ""
    @State var dateOfBirth: String = ""
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
                
                VStack {
                    Text("프로필을 만들어보세요!")
                        .foregroundColor(Color(hex: "2B2B2B"))
                        .font(.appleSDGothicNeo(.semiBold, size: 25))
                    
                    Spacer()
                        .frame(height: 81)
                    
                    VStack {
                        HStack {
                            Text("닉네임")
                                .font(.appleSDGothicNeo(.regular, size: 18))
                                .foregroundColor(Color(hex: "4B4B4B"))
                            Spacer()
                        }
                        TextField("닉네임을 입력해 주세요(10자 이내)", text: $nickname)
                            .padding(.horizontal, 10)
                        Divider()
                        
                        HStack {
                            Text("이미 사용중인 닉네임이에요🥲")
                                .font(.appleSDGothicNeo(.regular, size: 16))
                                .foregroundColor(.theme.warningRedColor)
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack {
                            Text("생년월일")
                                .font(.appleSDGothicNeo(.regular, size: 16))
                                .foregroundColor(Color(hex: "4B4B4B"))
                            Spacer()
                        }
                        TextField("0000.00.00", text: $dateOfBirth)
                            .padding(.horizontal, 10)
                        Divider()
                        
                        HStack {
                            Text("입력하신 생년월일이 맞나요?🥲")
                                .font(.appleSDGothicNeo(.regular, size: 18))
                                .foregroundColor(.theme.warningRedColor)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)

                }


                
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
