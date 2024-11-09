//
//  ProfileEditView.swift
//  KREAM
//
//  Created by 임효진 on 10/6/24.
//

import UIKit
import SnapKit

class ProfileEditView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(label)
        self.addSubview(profieImage)
        self.addSubview(profileInfolabel)
        self.addSubview(userEmailLabel)
        self.addSubview(emailTextField)
        self.addSubview(userPwLabel)
        self.addSubview(pwTextField)
        self.addSubview(emailEditButton)
        self.addSubview(passwordEditButton)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(66)
        }
        
        profieImage.snp.makeConstraints {
            $0.height.equalTo(90)
            $0.width.equalTo(90)
            $0.top.equalTo(label.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
        }
        
        profileInfolabel.snp.makeConstraints {
            $0.top.equalTo(profieImage.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(30)
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(profileInfolabel.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(30)
        }
        
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(30)
        }
        
        userPwLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(30)
        }
        
        pwTextField.snp.makeConstraints {
            $0.width.equalTo(282)
            $0.height.equalTo(32)
            $0.top.equalTo(userPwLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(30)
        }
        
        emailEditButton.snp.makeConstraints {
            $0.width.equalTo(52)
            $0.height.equalTo(32)
            $0.leading.equalTo(emailTextField.snp.trailing).offset(9)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
        }
        
        passwordEditButton.snp.makeConstraints {
            $0.width.equalTo(52)
            $0.height.equalTo(32)
            $0.leading.equalTo(pwTextField.snp.trailing).offset(9)
            $0.top.equalTo(userPwLabel.snp.bottom).offset(4)
        }
    }
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    // 프로필 이미지
    public lazy var profieImage: UIImageView = {
        let imageVIew = UIImageView()
        //imageVIew.image = UIImage(named: "profile_image")
        imageVIew.layer.cornerRadius = 90
        return imageVIew
    }()
    
    public lazy var profileInfolabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var userPwLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    // 이메일 텍스트필드
    public lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        
        emailTextField.frame = CGRect(x: 0, y: 0, width: 303, height: 34)
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        
        // 텍스트 필드 내부 패딩
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        
        // 모서리 둥글게
        emailTextField.layer.cornerRadius = 10
        
        // 테두리 설정
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0).cgColor
        
        emailTextField.isUserInteractionEnabled = false
        
        return emailTextField
    }()
    
    // 비밀번호 텍스트필드
    public lazy var pwTextField: UITextField = {
        let pwTextField = UITextField()
        
        pwTextField.frame = CGRect(x: 0, y: 0, width: 303, height: 34)
        pwTextField.font = UIFont.systemFont(ofSize: 14)
        
        // 텍스트 필드 내부 패딩
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        pwTextField.leftView = paddingView
        pwTextField.leftViewMode = .always
        
        // 모서리 둥글게
        pwTextField.layer.cornerRadius = 10
        
        // 테두리 설정
        pwTextField.layer.borderWidth = 1
        pwTextField.layer.borderColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0).cgColor
        
        pwTextField.isUserInteractionEnabled = false
        
        return pwTextField
    }()
    
    // 변경 버튼
    public lazy var emailEditButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("변경", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        editButton.setTitleColor(UIColor.black, for: .normal)
        editButton.backgroundColor = UIColor.white
        
        // 모서리 둥글게
        editButton.layer.cornerRadius = 6
        
        // 테두리 설정
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
        
        return editButton
    }()
    
    // 변경 버튼
    public lazy var passwordEditButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("변경", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        editButton.setTitleColor(UIColor.black, for: .normal)
        editButton.backgroundColor = UIColor.white
        
        // 모서리 둥글게
        editButton.layer.cornerRadius = 6
        
        // 테두리 설정
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
        
        return editButton
    }()
}
