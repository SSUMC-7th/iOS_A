import UIKit

class LoginView: UIView {
    
    // UI 요소 선언
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kream_logo") // 로고 이미지 넣기
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이메일 레이블
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 이메일 입력 필드
    let emailTextField: UITextField = {
        let textField = UITextField()
        
        // 플레이스홀더 텍스트 크기 줄이기
        let placeholder = NSAttributedString(string: "  예) kream@kream.co.kr",
                                             attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        textField.attributedPlaceholder = placeholder
        
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "round")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 비밀번호 레이블
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 비밀번호 입력 필드
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        // 플레이스홀더 텍스트 크기 줄이기
        let placeholder = NSAttributedString(string: "  비밀번호를 입력해주세요",
                                             attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        textField.attributedPlaceholder = placeholder
        
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "round")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 로그인 버튼
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemGray5
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 카카오 로그인 버튼
    let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        
 soonny/week4]-4주차-과제
       
        let customFont = UIFont(name: "Inter-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 16)
        
        let title = NSAttributedString(string: "카카오로 로그인", attributes: [
            .font: customFont

        // 'Inter-Bold' 폰트 사용 (프로젝트에 포함되어 있어야 함)
        let customFont = UIFont(name: "Inter-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 16)
        
        let title = NSAttributedString(string: "카카오로 로그인", attributes: [
            .font: customFont // Inter-Bold 폰트로 설정
 soonny/main
        ])
        
        button.setAttributedTitle(title, for: .normal)
        button.setImage(UIImage(named: "kakao_icon"), for: .normal) // 카카오 아이콘 설정
        button.tintColor = .black // 이미지 색상 설정
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentHorizontalAlignment = .center

       
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0) // 아이콘 위치
       
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //애플로그인
    
    let appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        
soonny/week4]-4주차-과제
       
      

        // 'Inter-Bold' 폰트 사용 (프로젝트에 포함되어 있어야 함)
        let customFont = UIFont(name: "Inter-Bold", size: 13) ?? UIFont.boldSystemFont(ofSize: 16)
        
        let title = NSAttributedString(string: "Apple로 로그인", attributes: [
            .font: customFont // Inter-Bold 폰트로 설정
 soonny/main
        ])
        
        button.setAttributedTitle(title, for: .normal)
        button.setImage(UIImage(named: "apple_icon"), for: .normal) // 애플 아이콘 설정
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentHorizontalAlignment = .center

        // 아이콘과 텍스트 사이의 간격 조정
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0) // 아이콘 위치
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout() {
        // UI 요소들을 뷰에 추가
        addSubview(logoImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(kakaoLoginButton)
        addSubview(appleLoginButton)
        
        // AutoLayout 설정
        NSLayoutConstraint.activate([
            // 로고 이미지
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 287),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),
            
            // 이메일 레이블
            emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            
            // 이메일 입력 필드
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            // 비밀번호 레이블
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            
            // 비밀번호 입력 필드
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            
            // 로그인 버튼
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            // 카카오 로그인 버튼
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            kakaoLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Apple 로그인 버튼
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45), // 왼쪽 45pt
            appleLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45), // 오른쪽 45pt
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

