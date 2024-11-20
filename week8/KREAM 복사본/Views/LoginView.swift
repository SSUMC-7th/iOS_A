//
//  LoginView.swift
//  MyKream
//
//  Created by 한태빈 on 9/28/24.
//

import UIKit

class LoginView: UIView {
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupAutoLayout()
    }
    
    // init(coder:)가 사용되지 않도록 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIImageView를 정의 (KREAM 로고)
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "Kream")
    }
    
    // 이메일 라벨
    private let emailLabel = UILabel().then {
        $0.text = "이메일 주소"
        $0.font = UIFont(name: "Inter", size: 12)
        $0.textColor = .black
    }
    
    // 이메일 텍스트 필드
    private let emailTextField = UITextField().then {
        $0.placeholder = "예) kream@kream.co.kr"
        $0.borderStyle = .roundedRect
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // 비밀번호 라벨
    private let passwordLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont(name: "Inter", size: 12)
        $0.textColor = .black
    }
    
    // 비밀번호 텍스트 필드
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }

    // 로그인 버튼
    let loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Inter", size: 14)
        $0.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }

    // 소셜 로그인 버튼 (카카오톡)
    let kakaoLoginButton = UIButton(type: .system).then {
        $0.setTitle("카카오로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Inter", size: 13)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 10
    }
    
    // 소셜 로그인 버튼 (Apple)
    let appleLoginButton = UIButton(type: .system).then {
        $0.setTitle("Apple로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Inter", size: 13)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 10
    }
    
    // UI 요소들을 뷰에 추가하는 메서드
    private func addComponents() {
        [logoImageView, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton, kakaoLoginButton, appleLoginButton].forEach {
            self.addSubview($0)
        }
    }
    
    // AutoLayout 설정 메서드
    private func setupAutoLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(126)
            $0.left.equalToSuperview().offset(53)
            $0.right.equalToSuperview().inset(53)
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
        
        emailLabel.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(15)
            $0.left.equalToSuperview().offset(45)
            $0.top.equalTo(logoImageView.snp.bottom).offset(87)
        }
        
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(34)
            $0.top.equalTo(emailLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().inset(45)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(15)
            $0.top.equalTo(emailTextField.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.width.equalTo(303)
            $0.height.equalTo(34)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().inset(45)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().inset(45)
            $0.height.equalTo(38)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().inset(47.5)
            $0.width.equalTo(298)
            $0.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(22)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().inset(47.5)
            $0.width.equalTo(298)
            $0.height.equalTo(40)
        }
    }
}

