//
//  OnboardingView.swift
//  TeamPlan
//
//  Created by sungyeon kim on 2023/02/05.
//

import SwiftUI

struct OnboardingStep {
    let title: String
    let description: String
    let imageName: String
}

private let onBoardingSteps = [
    OnboardingStep(title: "안녕하세요", description: "대학생부터 직장인까지! 프로젝트 관리 서비스 TEAMPLAN이에요", imageName: "onboarding_1"),
    OnboardingStep(title: "편하게", description: "언제 어디서든 팀원들의 진행률을 확인해요", imageName: "onboarding_2"),
    OnboardingStep(title: "한눈에", description: "공유캘린더를 통해서 팀,개인의 일정을 한눈에 확인해요", imageName: "onboarding_3"),
    OnboardingStep(title: "성장하는", description: "상호간의 간단한 피드백을 통해 프로젝트를 마무리하며 개인의 능력을 성장시켜요", imageName: "onboarding_4"),
]

struct OnboardingView: View {
    
    // Onboarding states:
    /*
     0 - 안녕하세요
     1 - 편하게
     2 - 한눈에
     3 - 성장하는 + 버튼 활성화
     */
    
    @State private var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    var body: some View {
        
        VStack {
            SkipButton()
            
            TabView(selection: $onboardingState) {
                ForEach(0..<onBoardingSteps.count) { index in
                    VStack {
                        Text(onBoardingSteps[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)
                            .padding(.bottom)
                        
                        Text(onBoardingSteps[index].description)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding(.horizontal, 32)
                        
                        Image(onBoardingSteps[index].imageName)
                        
                    }
                    .tag(index)
                    .background(Color.red)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            
//            Text("안녕하세요")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.purple)
//                .padding(.bottom)
//
//            VStack {
//                Text("대학생부터 직장인까지!")
//                    .font(.headline)
//                    .fontWeight(.heavy)
//                Text("프로젝트 관리 서비스 TEAMPLAN이에요")
//                    .font(.headline)
//
//            }
//
//            Image("onboarding_1")
            Spacer()
            
            bottomButton


        }
//        ZStack {
//            switch onboardingState {
//            case 0:
//                break
//            case 1:
//                break
//            case 2:
//                break
//            case 3:
//                break
//            default:
//                RoundedRectangle(cornerRadius: 25)
//                    .foregroundColor(.green)
//            }
//        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

 // MARK: - COMPONENTS

extension OnboardingView {
    
    private var bottomButton: some View {
        Button {
            
        } label: {
            Text("시작하기")
                .font(.headline)
                .foregroundColor(.gray)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                        .padding(.leading)
                        .padding(.trailing)
                )
        }

    }
    
    private var firstSection: some View {
        VStack {
            
        }
    }
}

struct SkipButton: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text("건너뛰기")
                   
            }
            .padding(.trailing)
            .foregroundColor(.gray)
        }
    }
}
