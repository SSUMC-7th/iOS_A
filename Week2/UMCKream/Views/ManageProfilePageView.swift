//
//  MyPage.swift
//  UMCKream
//
//  Created by 한태빈 on 10/6/24.
//

import UIKit
import SnapKit
class ManageProfilePageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    // init(coder:)가 사용되지 않도록 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // <--화살표
    //프로필 관리
    private let UpperNavigationText: UILabel = {
        let navigateText = UILabel()
        navigateText.text = "프로필 관리"
        navigateText.font = UIFont(name: "Pretendard", size: 16)
        navigateText.textColor = .black
        navigateText.translatesAutoresizingMaskIntoConstraints = false
        return navigateText
    }()
    //profileimage
    private let ProfileImageView: UIImageView = {
        let profile = UIImageView()
        profile.image = UIImage(named: "profile")
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.contentMode = .scaleAspectFit
        return profile
    }()
    //프로필 정보
    private let ProfileInfo: UILabel = {
        let info = UILabel()
        info.text = "프로필 관리"
        info.font = UIFont(name: "Pretendard", size: 18)
        info.textColor = .black
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    //유저 이메일
    private let EmailText: UILabel = {
        let email = UILabel()
        email.text = "유저 이메일"
        email.font = UIFont(name: "Pretendard", size: 14)
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    // 이메일 텍스트 필드
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@naver.com"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)  // 폰트 크기 조정
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    //유저 비밀번호
    private let PasswordText: UILabel = {
        let password = UILabel()
        password.text = "유저 비밀번호"
        password.font = UIFont(name: "Pretendard", size: 14)
        password.textColor = .black
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    // 비밀번호 텍스트 필드
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "********************"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // 변경 버튼
    private let ChangeButton: UIButton = {
        let Cbutton = UIButton(type: .system)
        Cbutton.setTitle("변경", for: .normal)
        Cbutton.titleLabel?.font = UIFont(name: "Pretendard", size: 14) // 폰트 설정
        Cbutton.layer.borderWidth = 1
        Cbutton.layer.borderColor = UIColor.black.cgColor
        Cbutton.layer.cornerRadius = 6
        Cbutton.translatesAutoresizingMaskIntoConstraints = false
        return Cbutton
    }()
    
    // UI 요소들을 뷰에 추가하는 메서드
    private func addComponents() {
        self.addSubview(UpperNavigationText)
        self.addSubview(ProfileImageView)
        self.addSubview(ProfileImageView)
        self.addSubview(EmailText)
        self.addSubview(emailTextField)
        self.addSubview(PasswordText)
        self.addSubview(passwordTextField)
        self.addSubview(ChangeButton)
        
        
    }
}
