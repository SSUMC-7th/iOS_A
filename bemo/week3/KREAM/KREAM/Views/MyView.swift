//
//  MyView.swift
//  KREAM
//
//  Created by 임효진 on 10/6/24.
//

import UIKit
import SnapKit

class MyView: UIView {
    
    // 프로필 이미지 default에 저장하기 위해 모델 선언
    private let loginModel = LoginModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addComponents() {
        self.addSubview(setting)
        self.addSubview(camera)
        self.addSubview(profieImage)
        self.addSubview(idLabel)
        self.addSubview(follower)
        self.addSubview(following)
        self.addSubview(editProfileButton)
        self.addSubview(shareProfileButton)
        
        setting.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.left.equalToSuperview().inset(32)
        }
        
        camera.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.right.equalToSuperview().inset(32)
        }
        
        profieImage.snp.makeConstraints {
            $0.height.equalTo(90)
            $0.width.equalTo(90)
            $0.top.equalTo(setting.snp.bottom).offset(26)
            $0.left.equalToSuperview().inset(32)
        }
        
        idLabel.snp.makeConstraints {
            $0.leading.equalTo(profieImage.snp.trailing).offset(16)
            $0.top.equalTo(profieImage.snp.top).offset(21)
        }
        
        follower.snp.makeConstraints {
            $0.leading.equalTo(profieImage.snp.trailing).offset(16)
            $0.top.equalTo(idLabel.snp.bottom).offset(6)
        }
        
        following.snp.makeConstraints {
            $0.leading.equalTo(follower.snp.trailing).offset(8)
            $0.top.equalTo(idLabel.snp.bottom).offset(6)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.height.equalTo(26)
            $0.width.equalTo(157)
            $0.top.equalTo(profieImage.snp.bottom).offset(26)
            $0.left.equalToSuperview().inset(32)
        }
        
        shareProfileButton.snp.makeConstraints {
            $0.height.equalTo(26)
            $0.width.equalTo(157)
            $0.top.equalTo(profieImage.snp.bottom).offset(26)
            $0.right.equalToSuperview().inset(32)
        }
    }
    
    public lazy var setting: UIImageView = {
        let setting = UIImageView()
        setting.image = UIImage(named: "setting_button")
        return setting
    }()
    
    public lazy var camera: UIImageView = {
        let camera = UIImageView()
        camera.image = UIImage(named: "camera_button")
        return camera
    }()
    
    public lazy var profieImage: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.image = UIImage(named: "profile_image")
        loginModel.saveUserProfileImage("profile_image") // 모델에 프로필 이미지 저장하기
        imageVIew.layer.cornerRadius = 90
        return imageVIew
    }()
    
    public lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var follower: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    
    public lazy var following: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    
    // 프로필 관리 버튼
    public lazy var editProfileButton: UIButton = {
        let editProfileButton = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = "프로필 관리"
        configuration.baseForegroundColor = .black
        
        // 버튼 글꼴 설정
        let font = UIFont.systemFont(ofSize: 9)
        configuration.attributedTitle = AttributedString("프로필 관리", attributes: AttributeContainer([.font: font]))
        
        editProfileButton.configuration = configuration
        
        // 모서리 둥글게
        editProfileButton.layer.cornerRadius = 8
        
        // 테두리 설정
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0).cgColor
        return editProfileButton
    }()
    
    // 프로필 공유 버튼
    public lazy var shareProfileButton: UIButton = {
        let shareProfileButton = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.title = "프로필 공유"
        configuration.baseForegroundColor = .black
        
        // 버튼 글꼴 설정
        let font = UIFont.systemFont(ofSize: 9)
        configuration.attributedTitle = AttributedString("프로필 공유", attributes: AttributeContainer([.font: font]))
        
        shareProfileButton.configuration = configuration
        shareProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 모서리 둥글게
        shareProfileButton.layer.cornerRadius = 8
        
        // 테두리 설정
        shareProfileButton.layer.borderWidth = 1
        shareProfileButton.layer.borderColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0).cgColor
        return shareProfileButton
    }()
    
}
