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

