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
    
    init() {
        print("KakaoAuthViewModel - init() called")
    }
    
    func handleKakaoLogin() {
        print("KakaoAuthViewModel - handleKakaoLogin")
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        } else { // 카톡이 설치가 안되어 있을 경우
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                    }
                }
        }
    } //: LOGIN
    
    func handleKakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }

    }
}
