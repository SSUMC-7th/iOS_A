//
//  ProfileEditViewController.swift
//  KREAM
//
//  Created by 임효진 on 10/6/24.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    private let loginModel = LoginModel()
    
    // 이메일 및 비밀번호 편집 상태
    private var isEditingEmail = false
    private var isEditingPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileEditView
        loadProfileInfo()
        
        // Do any additional setup after loading the view.
    }
    
    private lazy var profileEditView:  ProfileEditView = {
        let view = ProfileEditView()
        view.emailEditButton.addTarget(self, action: #selector(emailEditButtonTapped), for: .touchUpInside)
        view.passwordEditButton.addTarget(self, action: #selector(passwordEditButtonTapped), for: .touchUpInside)
        return view
    }()
    
    // 프로필 정보 가져오기
    private func loadProfileInfo() {
        
        // 프로필 이미지
        if let profileImageName = loginModel.loadUserProfileImage() {
            profileEditView.profieImage.image = UIImage(named: profileImageName)
        }
        
        // 이메일
        if let userEmail = loginModel.loadUserEmail() {
            profileEditView.emailTextField.text = userEmail
        }
        
        // 비밀번호
        if let userPassword = loginModel.loadUserPassword() {
            let coverdPassword = String(repeating: "*", count: userPassword.count)
            profileEditView.pwTextField.text = coverdPassword
        }
    }
    
    @objc func emailEditButtonTapped() {
        if isEditingEmail {
            // 확인 버튼이 눌렸을 때
            print("이메일 확인 버튼 누름")
            guard let email = profileEditView.emailTextField.text, !email.isEmpty else {
                return
            }
            loginModel.saveUserEmail(email)
            profileEditView.emailTextField.isUserInteractionEnabled = false
            profileEditView.emailEditButton.setTitle("변경", for: .normal)
            loadProfileInfo()
            isEditingEmail = false
        } else {
            print("이메일 변경 버튼 누름")
            profileEditView.emailTextField.isUserInteractionEnabled = true
            profileEditView.emailEditButton.setTitle("확인", for: .normal)
            isEditingEmail = true
            print(isEditingEmail)
        }
    }
    
    @objc func passwordEditButtonTapped(){
        if isEditingPassword {
            // 확인 버튼이 눌렸을 때
            print("비밀번호 확인 버튼 누름")
            guard let password = profileEditView.pwTextField.text, !password.isEmpty else {
                return
            }
            loginModel.saveUserPassword(password)
            profileEditView.pwTextField.isUserInteractionEnabled = false
            profileEditView.passwordEditButton.setTitle("변경", for: .normal)
            loadProfileInfo()
            isEditingPassword = false
        } else {
            print("이메일 변경 버튼 누름")
            profileEditView.pwTextField.isUserInteractionEnabled = true
            profileEditView.passwordEditButton.setTitle("확인", for: .normal)
            isEditingPassword = true
        }
    }
}
