import UIKit
import SnapKit


class SettingViewController: UIViewController {
    
    // 뒤로가기 버튼
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 프로필 관리 타이틀 레이블
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // 프로필 이미지
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image") // 프로필 이미지 설정
        imageView.layer.cornerRadius = 50 // 원형 이미지로 만들기 위한 설정
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // 프로필 정보 레이블
    let profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    // 유저 이메일 레이블
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    // 유저 이메일 입력 필드
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "example@naver.com"
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 14)

        textField.isUserInteractionEnabled = false

        return textField
    }()
    
    // 이메일 변경 버튼
    let changeEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5

        return button
    }()
    
    // 유저 비밀번호 레이블
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    // 유저 비밀번호 입력 필드
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "****************"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 14)

        textField.isUserInteractionEnabled = false

        return textField
    }()
    
    // 비밀번호 변경 버튼
    let changePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("변경", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()

    //이메일 // 비밀번호 버튼 변경을 위한 플래그 변수
    var isEmailEditing: Bool = false
    var isPasswordEditing: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
      
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(profileImageView)
        view.addSubview(profileInfoLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(changeEmailButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(changePasswordButton)
        
        
        
        setupLayout()
        
        
        backButton.addTarget(self, action: #selector(handleBackButtonTapped), for: .touchUpInside)

        
        // 이메일 변경 버튼과 비밀번호 변경 버튼에 액션 추가
        changeEmailButton.addTarget(self, action: #selector(handleChangeEmailButtonTapped), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(handleChangePasswordButtonTapped), for: .touchUpInside)
        
        // UserDefaults에서 저장된 이메일과 비밀번호 불러와서 텍스트 필드에 설정
           if let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
               emailTextField.text = userEmail
           }
           if let userPassword = UserDefaults.standard.string(forKey: "userPassword") {
               passwordTextField.text = userPassword
           }
        
    }
    // 이메일 변경 버튼 클릭 시 호출되는 메서드
        @objc func handleChangeEmailButtonTapped() {
            //변경 -> 확인
            changeEmailButton.setTitle("확인", for: .normal)
            
            // 이메일 텍스트 필드를 편집 가능하도록 설정
            emailTextField.isUserInteractionEnabled = true
            emailTextField.becomeFirstResponder()
            emailTextField.text = "" // 기존 텍스트 제거
            emailTextField.placeholder = "새로운 이메일을 입력해주세요 !"
            
            // 확인 버튼이 클릭되었을 때 UserDefaults에 새로운 이메일 저장
            changeEmailButton.removeTarget(self, action: #selector(handleChangeEmailButtonTapped), for: .touchUpInside)
            changeEmailButton.addTarget(self, action: #selector(saveNewEmail), for: .touchUpInside)
        }
        
        @objc func saveNewEmail() {
            // 이메일을 UserDefaults에 저장하고, 텍스트 필드 편집 불가하도록 변경
            if let newEmail = emailTextField.text, !newEmail.isEmpty {
                UserDefaults.standard.set(newEmail, forKey: "userEmail")
                emailTextField.isUserInteractionEnabled = false
                changeEmailButton.setTitle("변경", for: .normal) // 버튼 텍스트를 다시 "변경"으로 변경
                changeEmailButton.removeTarget(self, action: #selector(saveNewEmail), for: .touchUpInside)
                changeEmailButton.addTarget(self, action: #selector(handleChangeEmailButtonTapped), for: .touchUpInside)
            }
        }
        
        // 비밀번호 변경 버튼 클릭 시 호출되는 메서드
        @objc func handleChangePasswordButtonTapped() {
           //변경 -> 확인
            changePasswordButton.setTitle("확인", for: .normal)
            
            // 비밀번호 텍스트 필드를 편집 가능하도록 설정
            passwordTextField.isUserInteractionEnabled = true
            passwordTextField.becomeFirstResponder() // 텍스트 필드에 포커스 설정
            passwordTextField.text = "" // 기존 텍스트 제거
            passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!" // 플레이스홀더 변경
            
            // 확인 버튼이 클릭되었을 때 UserDefaults에 새로운 비밀번호 저장
            changePasswordButton.removeTarget(self, action: #selector(handleChangePasswordButtonTapped), for: .touchUpInside)
            changePasswordButton.addTarget(self, action: #selector(saveNewPassword), for: .touchUpInside)
        }
        
        @objc func saveNewPassword() {
            // 비밀번호를 UserDefaults에 저장하고, 텍스트 필드 편집 불가하도록 변경
            if let newPassword = passwordTextField.text, !newPassword.isEmpty {
                UserDefaults.standard.set(newPassword, forKey: "userPassword")
                passwordTextField.isUserInteractionEnabled = false
                changePasswordButton.setTitle("변경", for: .normal) // 버튼 텍스트를 다시 "변경"으로 변경
                changePasswordButton.removeTarget(self, action: #selector(saveNewPassword), for: .touchUpInside)
                changePasswordButton.addTarget(self, action: #selector(handleChangePasswordButtonTapped), for: .touchUpInside)
            }
        }
    
    //뒤로가기 매서드

        // 이메일 변경 버튼과 비밀번호 변경 버튼에 액션 추가
        changeEmailButton.addTarget(self, action: #selector(handleChangeEmailButtonTapped), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(handleChangePasswordButtonTapped), for: .touchUpInside)
    }
    // 이메일 변경 버튼 클릭 시 호출되는 메서드
       @objc func handleChangeEmailButtonTapped() {
           emailTextField.text = "" // 기존 텍스트 제거
           emailTextField.placeholder = "새로운 이메일을 입력해주세요 !" // 플레이스홀더 변경
       }
       
       // 비밀번호 변경 버튼 클릭 시 호출되는 메서드
       @objc func handleChangePasswordButtonTapped() {
           passwordTextField.text = "" // 기존 텍스트 제거
           passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!" // 플레이스홀더 변경
       }
    
    

    @objc func handleBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // 레이아웃 설정
    func setupLayout() {
        // 뒤로가기 버튼
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(24)
        }
        
        // 타이틀 레이블
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton)
            make.centerX.equalToSuperview()
        }
        
        // 프로필 이미지
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        // 프로필 정보 레이블
        profileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
        }
        
       
        // 유저 이메일 레이블
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
        
        // 유저 이메일 입력
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(32)
        }
        
        // 이메일 변경 버튼
        changeEmailButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.leading.equalTo(emailTextField.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.width.equalTo(58)
        }
        
        // 유저 비밀번호
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
        }
        
        // 유저 비밀번호 입력
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(32)
        }
        
        // 비밀번호 변경
        changePasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.leading.equalTo(passwordTextField.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.width.equalTo(58)
        }
    }
}

