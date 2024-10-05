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
        return setting
    }()
    //cameraimage
    private let CameraImageView: UIImageView = {
        let camera = UIImageView()
        camera.image = UIImage(named: "camera")
        camera.translatesAutoresizingMaskIntoConstraints = false
        camera.contentMode = .scaleAspectFit
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
        follower.text = "326"
        follower.font = UIFont(name: "Pretendard", size: 12)
        follower.textColor = .black
        follower.translatesAutoresizingMaskIntoConstraints = false
        return follower
    }()
    //팔로잉
    private let FollowingCount: UILabel = {
        let following = UILabel()
        following.text = "20"
        following.font = UIFont(name: "Pretendard", size: 12)
        following.textColor = .black
        following.translatesAutoresizingMaskIntoConstraints = false
        return following
    }()
    // ManageButton 버튼
    private let ManageButton: UIButton = {
        let Mbutton = UIButton(type: .system)
        Mbutton.setTitle("프로필 관리", for: .normal)
        Mbutton.titleLabel?.font = UIFont(name: "Pretendard", size: 9) // 폰트 설정
        Mbutton.layer.borderWidth = 0.8
        Mbutton.layer.borderColor = UIColor.gray.cgColor
        Mbutton.layer.cornerRadius = 8
        Mbutton.translatesAutoresizingMaskIntoConstraints = false
        return Mbutton
    }()
    //ShareButton
    private let ShareButton: UIButton = {
        let Sbutton = UIButton(type: .system)
        Sbutton.setTitle("프로필 공유", for: .normal)
        Sbutton.titleLabel?.font = UIFont(name: "Pretendard", size: 9) // 폰트 설정
        Sbutton.layer.borderWidth = 0.8
        Sbutton.layer.borderColor = UIColor.gray.cgColor
        Sbutton.layer.cornerRadius = 8
        Sbutton.translatesAutoresizingMaskIntoConstraints = false
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
}
