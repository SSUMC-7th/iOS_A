//
//  ViewController.swift
//  KREAM
//
//  Created by 임효진 on 9/28/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView:  LoginView = {
        let view = LoginView()
        view.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        view.appleLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    @objc func loginButtonTapped(){
        print("로그인 누름")
        
        guard let email = loginView.emailTextField.text, !email.isEmpty else {
            return
        }
        
        guard let password = loginView.pwTextField.text, !password.isEmpty else {
            return
        }
        
        // 정보 저장
        loginModel.saveUserEmail(email)
        loginModel.saveUserPassword(password)
        
        // 화면 이동
        let viewController = MainViewController()
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
    @objc func kakaoLoginButtonTapped(){
        print("카카로로 로그인 누름")
    }
    
    @objc func appleLoginButtonTapped(){
        print("apple로 로그인 누름")
    }
    
}
