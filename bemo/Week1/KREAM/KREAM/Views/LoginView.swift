//
//  LoginView.swift
//  KREAM
//
//  Created by 임효진 on 9/28/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(imageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(pwLabel)
        self.addSubview(pwTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 53),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53),
            
            emailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 87),
            emailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            pwLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            pwLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            
            pwTextField.topAnchor.constraint(equalTo: pwLabel.bottomAnchor, constant: 8),
            pwTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            pwTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            pwTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 17),
            loginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            loginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            kakaoLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            appleLoginButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    // 이미지
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Kream_logo")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 이메일 주소 라벨
    public lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        
        emailLabel.text = "이메일 주소"
        emailLabel.font = UIFont.systemFont(ofSize: 12)
        emailLabel.textColor = UIColor.black
        emailLabel.textAlignment = .left
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return emailLabel
    }()
    
    // 이메일 주소 텍스트필드
    public lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        emailTextField.frame = CGRect(x: 0, y: 0, width: 303, height: 34)
        
        // 모서리 둥굴게
        emailTextField.layer.cornerRadius = 15
        
        // 테두리 설정
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0).cgColor
        
        // 텍스트 필드 내부 왼쪽 여백
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        emailTextField.leftViewMode = .always
        
        // 텍스트 설정
        let placeholderText = "예) kream@kream.co.kr"
        let placeholderColor = UIColor.gray
        emailTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        emailTextField.font = UIFont.systemFont(ofSize: 12)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    // 비밀번호 라벨
    public lazy var pwLabel: UILabel = {
        let pwLabel = UILabel()
        
        pwLabel.text = "비밀번호"
        pwLabel.font = UIFont.systemFont(ofSize: 12)
        pwLabel.textColor = UIColor.black
        pwLabel.textAlignment = .left
        
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return pwLabel
    }()
    
    // 비밀번호 텍스트필드
    public lazy var pwTextField: UITextField = {
        let pwTextField = UITextField()
        
        pwTextField.frame = CGRect(x: 0, y: 0, width: 303, height: 34)
        
        // 모서리 둥글게
        pwTextField.layer.cornerRadius = 15
        
        // 테두리 설정
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0).cgColor
        
        // 텍스트 필드 내부 패딩
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        pwTextField.leftView = paddingView
        pwTextField.leftViewMode = .always
        
        // 텍스트 설정
        let placeholderText = "비밀번호를 입력해주세요"
        let placeholderColor = UIColor.gray
        pwTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        pwTextField.font = UIFont.systemFont(ofSize: 12)
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return pwTextField
    }()
    
    // 로그인 버튼
    public lazy var loginButton: UIButton = {
        let loginbtn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = "로그인"
        configuration.baseForegroundColor = .white
        
        // 버튼 글꼴 설정
        let font = UIFont.systemFont(ofSize: 14)
        configuration.attributedTitle = AttributedString("로그인", attributes: AttributeContainer([.font: font]))
        
        loginbtn.configuration = configuration
        loginbtn.translatesAutoresizingMaskIntoConstraints = false
        
        // 모서리 둥글게
        loginbtn.layer.cornerRadius = 8
        
        // 버튼 배경 색 설정
        loginbtn.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        
        return loginbtn
    }()
    
    // 카카오 로그인 버튼
    public lazy var kakaoLoginButton: UIButton = {
        let loginbtn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        if let image = UIImage(named: "Kakao_logo") {
            configuration.image = image
            configuration.imagePlacement = .leading
        }
        
        // 버튼 텍스트 설정
        let font = UIFont.boldSystemFont(ofSize: 14)
        configuration.attributedTitle = AttributedString("카카오로 로그인", attributes: AttributeContainer([.font: font]))
        configuration.baseForegroundColor = .black
        
        loginbtn.configuration = configuration
        loginbtn.translatesAutoresizingMaskIntoConstraints = false
        
        // 모서리 둥글게
        loginbtn.layer.cornerRadius = 10
        
        // 테두리 설정
        loginbtn.layer.borderWidth = 1
        loginbtn.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0).cgColor
        
        return loginbtn
    }()
    
    // APPLE 로그인 버튼
    public lazy var appleLoginButton: UIButton = {
        let loginbtn = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        if let image = UIImage(named: "Apple_logo") {
            configuration.image = image
            configuration.imagePlacement = .leading
        }
        
        // 버튼 텍스트 설정
        let font = UIFont.boldSystemFont(ofSize: 14)
        configuration.attributedTitle = AttributedString("Apple로 로그인", attributes: AttributeContainer([.font: font]))
        configuration.baseForegroundColor = .black
        
        loginbtn.configuration = configuration
        loginbtn.translatesAutoresizingMaskIntoConstraints = false
        
        // 모서리 둥글게
        loginbtn.layer.cornerRadius = 10
        
        // 테두리 설정
        loginbtn.layer.borderWidth = 1
        loginbtn.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0).cgColor
        
        return loginbtn
    }()
    
}
