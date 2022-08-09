//
//  ViewController.swift
//  FaceIdExample
//
//  Created by sungyeon kim on 2022/08/09.
//

// 1. LocalAuthentication import
// 2. info.plist 파일에 Privacy - Face ID Usage Description 설정
// 사용자가 기기내에서 인증하는 부분을 다루는 프레임워크
import LocalAuthentication
import UIKit

/*
    실기기 없이 Xcode Simulator에서 페이스 인증 실행하는 방법
    Xcode Simulator Toolbar -> Features -> Face ID 에서 Matching Face or non-Matching Face로 테스트
 */

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setTitle("인증하기", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.center = view.center
    }
    
    @objc private func didTapButton() {
        
        // 3. LAContext 인스턴스 생성
        let context = LAContext()
        var error: NSError? = nil
        
     
        // 4. evaluatePolicy(_:localizedReason: reply:)함수로 생체인식 인증 or Passcode 사용한 인증을 실행해줌
        // 성공여부에 따라 Bool값 리턴
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "개인정보 보호를 위해 인증이 필요합니다."
            
            /*
                1 .deviceOwnerAuthenticationWithBiometrics: iOS9 이후부터 인증이 실패했을 때 나오는 암호입력 버튼을 눌러도 아무 반응 없음.
                Fallback 버튼이 나오지 않도록 코드를 수정하거나, deviceOwnerAuthentication으로 대체
             
                2. deviceOwnerAuthentication: 생체인식 인증이 등록되어 있는 경우 생체인식을 실행. 생체인식 인증이 등록되어 있지 않거나 실패할 경우,
                암호 인증 실행
             
             */
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                 
                    // 인증 실패시
                    // 인증 두번 실패하면 암호입력 선택창 띄워짐
                    guard success, error == nil else {
                       
                        print("인증실패: \(success)")
                        let alert = UIAlertController(title: "인증 실패", message: "인증을 다시 시도해주세요.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        return
                    }
                    
                    print("인증성공: \(success)")
                    // 인증 성공시
                    let vc = SecondViewController()
                    vc.title = "인증성공"
                    vc.view.backgroundColor = .systemPink
                    self?.present(UINavigationController(rootViewController: vc), animated: true)
                }
            }
        } else {
            
            // 인증을 사용하지 못하는 경우
            // 사용자 설정으로 이동시키기
            let alert = UIAlertController(title: "인증권한 요청을 거절하셨으므로 이 기능을 사용할 수 없습니다.", message: "권한설정을 변경하시겠습니까?.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(NSURL(string:UIApplication.openSettingsURLString)! as URL)
                } else {
                    UIApplication.shared.openURL(NSURL(string: UIApplication.openSettingsURLString)! as URL)
                }
            }))
            
            present(alert, animated: true)
        }
    }
}

