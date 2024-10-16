//
//  ViewController.swift
//  iOSFirstProject
//
//  Created by 소민준 on 9/28/24.
//

import UIKit

/// 로그인 화면 뷰 컨트롤러
class LoginViewController: UIViewController {
    
    
    private let loginView = LoginView()
    let userInfo: UserInfo = UserInfo(id: "JeOng", pwd: "1234")
    
    /// 앱 실행 단계
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        loginView.loginButton.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
    }
    
    
    
    
    /// 데이터 모델에 지정한 아이디, 비밀번호에 해당 할 경우 로그인 가능하도록 하는 함수
    @objc private func loginFunction() {
        guard let inputId = loginView.emailTextField.text,
              let inputPwd = loginView.passwordTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else {
            print("아이디와 비밀번호를 입력해주세요")
            return
        }
        
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pwd == inputPwd {
                print("기존 사용자 로그인 성공")
                changeRootView()
            } else {
                print("아이디 또는 비밀번호 불일치")
            }
        } else {
            let newUserInfo = UserInfo(id: inputId, pwd: inputPwd)
            newUserInfo.saveUserDefaults()
            print("아이디 비밀번호 새롭게 갱신 및 로그인 성공")
            changeRootView()
        }
    }
    
    /// 로그인 뷰 -> TabBarController 루트 뷰 전환 함수
    private func changeRootView() {
        let rootVC = MainHomeViewController()
        
        // 모달 형식으로 화면 전환
        rootVC.modalPresentationStyle = .fullScreen
        self.present(rootVC, animated: true, completion: nil)
    }

    
}
