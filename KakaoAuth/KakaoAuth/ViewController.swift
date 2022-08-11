//
//  ViewController.swift
//  KakaoAuth
//
//  Created by sungyeon kim on 2022/08/10.
//

import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    
    lazy var kakaoAuthViewModel: KakaoAuthViewModel = { KakaoAuthViewModel()} ()

    lazy var kakaoLoginStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 여부 레이블"
        return label
    }()
    
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그인", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var kakaoLogoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그아웃", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView =  {
       let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        
        kakaoLoginStatusLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(70)
        }
        
        [kakaoLoginStatusLabel, kakaoLoginButton, kakaoLogoutButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        stackView.snp.makeConstraints {
            $0.center.equalTo(self.view)
        }
        
        setBindings()
    }
    
    // MARK: - BUTTON ACTION
    @objc func didTapLogin() {
        print(#function)
        kakaoAuthViewModel.handleKakaoLogin()
    }
    
    @objc func didTapLogout() {
        print(#function)
        kakaoAuthViewModel.kakaoLogout()
    }

} // MARK: - VIEW CONTROLLER

    // MARK: - VIEWMODEL BINDING
extension ViewController {
    func setBindings() {
        self.kakaoAuthViewModel.$isLoggedIn.sink { [weak self] isLoggedIn in
            guard let self = self else { return }
            self.kakaoLoginStatusLabel.text = isLoggedIn ? "로그인상태" : "로그아웃상태"
            
        }
        .store(in: &subscriptions)
    }
}

#if DEBUG

// 컨트롤 + 커맨드 + 엔터 : 미리보기창
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

#endif

