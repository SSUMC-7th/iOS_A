//
//  ViewController.swift
//  iOSFirstProject
//
//  Created by 소민준 on 9/28/24.
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

    // UIImageView를 정의 (상단 로고)
    private let logoImageView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: "KreamLogo")
        return logo
    }()
    
    // 이메일 라벨
        let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 이메일 텍스트 필드
        let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) example@example.com"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 비밀번호 라벨
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont(name: "Inter", size: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 비밀번호 텍스트 필드
        let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // 로그인 버튼
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 14)
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        // 소셜 로그인 버튼 (카카오톡)
    private let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오로 로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 13)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 소셜 로그인 버튼 (Apple)
    private let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter", size: 13)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // UI 요소들을 뷰에 추가하는 메서드
    private func addComponents() {
        addSubview(logoImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(kakaoLoginButton)
        addSubview(appleLoginButton)
    }

    // AutoLayout 설정 메서드
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            // 로고 이미지뷰 설정
            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 126),
            logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            logoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),
            logoImageView.widthAnchor.constraint(equalToConstant: 287),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),

            // 이메일 라벨
            emailLabel.widthAnchor.constraint(equalToConstant: 303),
            emailLabel.heightAnchor.constraint(equalToConstant: 15),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 87),
            
            // 이메일 입력 필드
            emailTextField.widthAnchor.constraint(equalToConstant: 303),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),

            // 비밀번호 라벨
            passwordLabel.widthAnchor.constraint(equalToConstant: 303),
            passwordLabel.heightAnchor.constraint(equalToConstant: 15),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),

            // 비밀번호 입력 필드
            passwordTextField.widthAnchor.constraint(equalToConstant: 303),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),

            // 로그인 버튼
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            loginButton.heightAnchor.constraint(equalToConstant: 38),

            // 카카오 로그인 버튼
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            kakaoLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            kakaoLoginButton.widthAnchor.constraint(equalToConstant: 298),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),

            // Apple 로그인 버튼
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 47.5),
            appleLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -47.5),
            appleLoginButton.widthAnchor.constraint(equalToConstant: 298),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
