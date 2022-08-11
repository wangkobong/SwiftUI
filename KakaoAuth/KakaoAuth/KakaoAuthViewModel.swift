//
//  KakaoAuthViewModel.swift
//  KakaoAuth
//
//  Created by sungyeon kim on 2022/08/11.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoggedIn: Bool = false
    
    init() {
        print("KakaoAuthViewModel - init() called")
    }
    
    func kakaoLoginWithApp() async -> Bool{
        // 카카오톡 앱으로 로그인 인증
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func kakaoLoginWithAccount() async  -> Bool {
        await withCheckedContinuation { continuation in
            // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        continuation.resume(returning: true)
                    }
                }
        }
    }
    
    @MainActor
    func handleKakaoLogin() {
        print("KakaoAuthViewModel - handleKakaoLogin")
        Task {
            // 카카오톡 설치 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                isLoggedIn = await kakaoLoginWithApp()
            } else { // 카톡이 설치가 안되어 있을 경우
                isLoggedIn = await kakaoLoginWithAccount()
            }
        }

    } //: LOGIN
    
    func kakaoLogout() {
        Task {
            if await handleKakaoLogout() {
                self.isLoggedIn = false
            }
        }
    }
    
    @MainActor
    func handleKakaoLogout() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }

        }
    }
}
