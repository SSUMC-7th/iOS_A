import UIKit


class MyPageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // SettingImageView
    private let settingImageView = UIImageView().then {
        $0.image = UIImage(named: "setting")
        $0.contentMode = .scaleAspectFit
    }
    
    // CameraImageView
    private let cameraImageView = UIImageView().then {
        $0.image = UIImage(named: "camera")
        $0.contentMode = .scaleAspectFit
    }
    
    // ProfileImageView
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFit
    }
    
    // ProfileName Label
    private let profileName = UILabel().then {
        $0.text = "Xoqls_iOS"
        $0.font = UIFont(name: "Pretendard", size: 16)
        $0.textColor = .black
    }
    
    // FollowerCount Label
    private let followerCount = UILabel().then {
        $0.text = "팔로워 489"
        $0.font = UIFont(name: "Pretendard", size: 12)
        $0.textColor = .black
    }
    
    // FollowingCount Label
    private let followingCount = UILabel().then {
        $0.text = "팔로잉 486"
        $0.font = UIFont(name: "Pretendard", size: 12)
        $0.textColor = .black
    }
    
    // ManageButton
    let manageButton = UIButton(type: .system).then {
        $0.setTitle("프로필 관리", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard", size: 9)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 8
    }
    
    // ShareButton
    private let shareButton = UIButton(type: .system).then {
        $0.setTitle("프로필 공유", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard", size: 9)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 0.8
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 8
    }
    
    // Add components to view
    private func addComponents() {
        [settingImageView, cameraImageView, profileImageView, profileName, followerCount, followingCount, manageButton, shareButton].forEach {
            self.addSubview($0)
        }
    }
    
    // Setup constraints
    private func setupConstraints() {
        settingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.leading.equalToSuperview().offset(32.5)
            make.height.width.equalTo(25)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.trailing.equalToSuperview().inset(32.5)
            make.height.width.equalTo(25)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(90)
            make.top.equalToSuperview().offset(126)
            make.leading.equalToSuperview().offset(32.5)
        }
        
        profileName.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(147)
        }
        
        followerCount.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileName.snp.bottom).offset(6)
        }
        
        followingCount.snp.makeConstraints { make in
            make.leading.equalTo(followerCount.snp.trailing).offset(8)
            make.top.equalTo(profileName.snp.bottom).offset(6)
        }
        
        manageButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(242)
            make.leading.equalToSuperview().offset(32.5)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(242)
            make.leading.equalTo(manageButton.snp.trailing).offset(14)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
}

