//
//  MyPage.swift
//  UMCKream
//
//  Created by 한태빈 on 10/6/24.
//

import UIKit
import SnapKit
class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    // init(coder:)가 사용되지 않도록 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // settingimage
    private let SettingImageView: UIImageView = {
        let setting = UIImageView()
        setting.image = UIImage(named: "setting")
        setting.translatesAutoresizingMaskIntoConstraints = false
        setting.contentMode = .scaleAspectFit
        //image라 크기 조절이 안된다고 해서 이 코드를 setting.height.equalTo(25) 아래처럼 구현
        setting.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        return setting
    }()
    //cameraimage
    private let CameraImageView: UIImageView = {
        let camera = UIImageView()
        camera.image = UIImage(named: "camera")
        camera.translatesAutoresizingMaskIntoConstraints = false
        camera.contentMode = .scaleAspectFit
        camera.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        return camera
    }()
    //profileimage
    private let ProfileImageView: UIImageView = {
        let profile = UIImageView()
        profile.image = UIImage(named: "profile")
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.contentMode = .scaleAspectFit
        return profile
    }()
    //profile name
    private let ProfileName: UILabel = {
        let name = UILabel()
        name.text = "Jeong_iOS"
        name.font = UIFont(name: "Pretendard", size: 16)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    //팔로워
    private let FollowerCount: UILabel = {
        let follower = UILabel()
        follower.text = "팔로워 326"
        follower.font = UIFont(name: "Pretendard", size: 12)
        follower.textColor = .black
        follower.translatesAutoresizingMaskIntoConstraints = false
        return follower
    }()
    //팔로잉
    private let FollowingCount: UILabel = {
        let following = UILabel()
        following.text = "팔로잉 20"
        following.font = UIFont(name: "Pretendard", size: 12)
        following.textColor = .black
        following.translatesAutoresizingMaskIntoConstraints = false
        return following
    }()
    // ManageButton 버튼
     let ManageButton: UIButton = {
        let Mbutton = UIButton(type: .system)
        Mbutton.setTitle("프로필 관리", for: .normal)
        Mbutton.titleLabel?.font = UIFont(name: "Pretendard", size: 9) // 폰트 설정
        Mbutton.setTitleColor(.black, for: .normal)
        Mbutton.layer.borderWidth = 0.8
        Mbutton.layer.borderColor = UIColor.gray.cgColor
        Mbutton.layer.cornerRadius = 8
        Mbutton.translatesAutoresizingMaskIntoConstraints = false
        Mbutton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        return Mbutton
    }()
    //ShareButton
    private let ShareButton: UIButton = {
        let Sbutton = UIButton(type: .system)
        Sbutton.setTitle("프로필 공유", for: .normal)
        Sbutton.titleLabel?.font = UIFont(name: "Pretendard", size: 9) // 폰트 설정
        Sbutton.setTitleColor(.black, for: .normal)
        Sbutton.layer.borderWidth = 0.8
        Sbutton.layer.borderColor = UIColor.gray.cgColor
        Sbutton.layer.cornerRadius = 8
        Sbutton.translatesAutoresizingMaskIntoConstraints = false
        Sbutton.snp.makeConstraints { make in
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        return Sbutton
    }()
    
    // UI 요소들을 뷰에 추가하는 메서드
    private func addComponents() {
        self.addSubview(SettingImageView)
        self.addSubview(CameraImageView)
        self.addSubview(ProfileImageView)
        self.addSubview(ProfileName)
        self.addSubview(FollowerCount)
        self.addSubview(FollowingCount)
        self.addSubview(ManageButton)
        self.addSubview(ShareButton)
    }
    private func setupConstraints() {
            SettingImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(75)
                make.leading.equalToSuperview().offset(32.5)
            }
            
            CameraImageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(75)
                make.trailing.equalToSuperview().inset(32.5)
            }
            
            ProfileImageView.snp.makeConstraints { make in
                make.height.equalTo(90)
                make.width.equalTo(90)
                make.top.equalToSuperview().offset(126)
                make.leading.equalToSuperview().offset(32.5)
            }
            
            ProfileName.snp.makeConstraints { make in
                make.leading.equalTo(ProfileImageView.snp.trailing).offset(16)
                make.top.equalToSuperview().offset(147)
            }
            
            FollowerCount.snp.makeConstraints { make in
                make.leading.equalTo(ProfileImageView.snp.trailing).offset(16)
                make.top.equalTo(ProfileName.snp.bottom).offset(6)
            }
            
            FollowingCount.snp.makeConstraints { make in
                make.leading.equalTo(FollowerCount.snp.trailing).offset(8)
                make.top.equalTo(ProfileName.snp.bottom).offset(6)
            }
            
            ManageButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(242)
                make.leading.equalToSuperview().offset(32.5)
            }
            
            ShareButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(242)
                make.leading.equalTo(ManageButton.snp.trailing).offset(14)
            }
        
    }
}
