//
//  SignupView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/03/14.
//

import SwiftUI
import WrappingHStack

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var signupState: Int = 0
    
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    let jobs = ["직장인", "대학(원)생", "프리랜서", "기타"]
    let interests = [
        "IT / TECH", "가전 / 전자", "철강", "Display", "건설 / 건축 / 인테리어", "반도체", "콘텐츠",
        "2차전지", "정유", "FMCG /음식 / 소매", "석유화학", "스마트물류 / 유통", "바이오 / 헬스케어", "인공지능 / IoT","기타"
    ]
    
    let abilities = [
        "변화관리", "창의 융합", "신뢰 구축", "협상", "경청, 조언, 상담", "문제 해결(트러블슈팅)", "집중력, 업무추진", "비즈니스 운영, 관리", "기획, 전략 설정", "커뮤니케이션", "회계, 예산관리", "세일즈(판매)", "인적자원운영"
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

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
                
                Spacer()
                    .frame(height: 42)
                

                abilitiesSection
                
                Spacer()
                
                Text("다음")
                    .frame(width: 300, height: 96)
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.mainPurpleColor)
                    .foregroundColor(.theme.whiteColor)
                    .font(.appleSDGothicNeo(.regular, size: 20))
                    .onTapGesture {
                        
                    }
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

// MARK: - COMPONENTS
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
    
    private var profileSection: some View {
        VStack {
            HStack {
                Text("프로필을 만들어보세요!")
                    .foregroundColor(Color(hex: "2B2B2B"))
                    .font(.appleSDGothicNeo(.semiBold, size: 25))
                Spacer()
            }
            .padding(.horizontal, 16)
            
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
                        .opacity(0.0)
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
                        .font(.appleSDGothicNeo(.regular, size: 16))
                        .foregroundColor(.theme.warningRedColor)
                        .opacity(0.0)
                    Spacer()
                }
            }
            .padding(.horizontal, 16)

        }

    }
    
    private var jobSection: some View {
        VStack {
            HStack {
                Text("어떤 일을 하시나요?")
                    .foregroundColor(Color(hex: "2B2B2B"))
                    .font(.appleSDGothicNeo(.semiBold, size: 25))
                Spacer()
            }
            .padding(.horizontal, 16)

            
            WrappingHStack(alignment: .leading) {
                ForEach(jobs, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .overlay {
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .onTapGesture {
                            print(item)
                        }
                }
            }
            .padding()
        }
    }
    
    private var interestSection: some View {
        VStack {
            HStack {
                Text("어떤 분야에 관심있으신가요??")
                    .foregroundColor(Color(hex: "2B2B2B"))
                    .font(.appleSDGothicNeo(.semiBold, size: 25))
                Spacer()
            }
            .padding(.horizontal, 16)

            WrappingHStack(alignment: .leading) {
                ForEach(interests, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .overlay {
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .onTapGesture {
                            print(item)
                        }
                }
            }
            .padding()

        }
    }
    
    private var abilitiesSection: some View {
        VStack {
            HStack {
                Text("당신의 능력 BEST 4는 무엇인가요?")
                    .foregroundColor(Color(hex: "2B2B2B"))
                    .font(.appleSDGothicNeo(.semiBold, size: 25))
                Spacer()
            }
            .padding(.horizontal, 16)

            WrappingHStack(alignment: .leading) {
                ForEach(abilities, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .overlay {
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .onTapGesture {
                            print(item)
                        }
                }
            }
            .padding()

        }
    }
}

