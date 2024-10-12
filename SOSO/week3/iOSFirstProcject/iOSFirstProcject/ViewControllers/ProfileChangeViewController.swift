//
//  ProfileChangeViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit
import SnapKit

class ProfileChangeViewController: UIViewController {

    // 뒤로가기 버튼
        private let backButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.tintColor = .black
            return button
        }()
        
        // 프로필 이미지
        private let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "somong")
            imageView.layer.cornerRadius = 50
            imageView.clipsToBounds = true
            return imageView
        }()
        
        // 이메일 입력 필드
        private let emailTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "새로운 이메일을 입력해주세요!"
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: 14)
            return textField
        }()
        
        // 비밀번호 입력 필드
        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "새로운 비밀번호를 입력해주세요!"
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            textField.font = UIFont.systemFont(ofSize: 14)
            return textField
        }()
        
        // 이메일 확인 버튼
        private let emailConfirmButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("확인", for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.gray.cgColor
            return button
        }()
        
        // 비밀번호 확인 버튼
        private let passwordConfirmButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("확인", for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.gray.cgColor
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            // 뷰에 요소 추가
            view.addSubview(backButton)
            view.addSubview(profileImageView)
            view.addSubview(emailTextField)
            view.addSubview(emailConfirmButton)
            view.addSubview(passwordTextField)
            view.addSubview(passwordConfirmButton)

            setupLayout()
            
            // 뒤로가기 버튼 액션
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }
        
        private func setupLayout() {
            // 뒤로가기 버튼 레이아웃
            backButton.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
                make.left.equalToSuperview().offset(20)
            }

            // 프로필 이미지 레이아웃
            profileImageView.snp.makeConstraints { make in
                make.top.equalTo(backButton.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
                make.width.height.equalTo(100)
            }

            // 이메일 입력 필드 레이아웃
            emailTextField.snp.makeConstraints { make in
                make.top.equalTo(profileImageView.snp.bottom).offset(40)
                make.left.equalToSuperview().offset(30)
                make.right.equalToSuperview().offset(-110)
                make.height.equalTo(40)
            }

            // 이메일 확인 버튼 레이아웃
            emailConfirmButton.snp.makeConstraints { make in
                make.centerY.equalTo(emailTextField)
                make.left.equalTo(emailTextField.snp.right).offset(10)
                make.width.equalTo(80)
                make.height.equalTo(40)
            }

            // 비밀번호 입력 필드 레이아웃
            passwordTextField.snp.makeConstraints { make in
                make.top.equalTo(emailTextField.snp.bottom).offset(20)
                make.left.equalToSuperview().offset(30)
                make.right.equalToSuperview().offset(-110)
                make.height.equalTo(40)
            }

            // 비밀번호 확인 버튼 레이아웃
            passwordConfirmButton.snp.makeConstraints { make in
                make.centerY.equalTo(passwordTextField)
                make.left.equalTo(passwordTextField.snp.right).offset(10)
                make.width.equalTo(80)
                make.height.equalTo(40)
            }
        }

        // 뒤로가기 버튼 액션
        @objc private func backButtonTapped() {
            navigationController?.popViewController(animated: true)
        }
    }
    

