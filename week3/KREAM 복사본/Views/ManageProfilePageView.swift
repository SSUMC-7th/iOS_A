import UIKit
import SnapKit

class ManageProfilePageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let ProfileImageView: UIImageView = {
        let Profile = UIImageView()
        Profile.image = UIImage(named: "setting")
        Profile.translatesAutoresizingMaskIntoConstraints = false
        Profile.contentMode = .scaleAspectFit
        //image 크기 조절이 안된다고 해서 이 코드를 setting.height.equalTo(25) 아래처럼 구현
        Profile.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
        }
        return Profile
    }()
    //profile info
        private let ProfileInfo: UILabel = {
            let info = UILabel()
            info.text = "프로필 정보"
            info.font = UIFont(name: "Pretendard", size: 18)
            info.textColor = .black
            info.translatesAutoresizingMaskIntoConstraints = false
            return info
        }()
    //UserEmail
        private let UserEmail: UILabel = {
            let mail = UILabel()
            mail.text = "유저 이메일"
            mail.font = UIFont(name: "Pretendard", size: 14)
            mail.textColor = .black
            mail.translatesAutoresizingMaskIntoConstraints = false
            return mail
        }()
    //UseremailTextFiled
    private let UseremailTextField: UITextField = {
        let mailtext = UITextField()
        mailtext.placeholder = "taebin325@gmail.com"
        mailtext.borderStyle = .roundedRect
        mailtext.font = UIFont(name: "Pretendard", size: 14)
        mailtext.textColor = .black
        mailtext.layer.cornerRadius = 10
        mailtext.layer.borderWidth = 1
        mailtext.layer.borderColor = UIColor.lightGray.cgColor
        mailtext.translatesAutoresizingMaskIntoConstraints = false
        return mailtext
    }()
    //Userpw
        private let Userpw: UILabel = {
            let pw = UILabel()
            pw.text = "유저 비밀번호"
            pw.font = UIFont(name: "Pretendard", size: 14)
            pw.textColor = .black
            pw.translatesAutoresizingMaskIntoConstraints = false
            return pw
        }()
    //UserpwTextFiled
    private let UserpwTextField: UITextField = {
        let pwtext = UITextField()
        pwtext.placeholder = "qpalzm()"
        pwtext.borderStyle = .roundedRect
        pwtext.font = UIFont(name: "Pretendard", size: 14)
        pwtext.textColor = .black
        pwtext.layer.cornerRadius = 10
        pwtext.layer.borderWidth = 1
        pwtext.layer.borderColor = UIColor.lightGray.cgColor
        pwtext.translatesAutoresizingMaskIntoConstraints = false
        return pwtext
    }()
    
    func ChangeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        return button
    }
    func ChangeButton2() -> UIButton {
        let button2 = UIButton(type: .system)
        button2.setTitle("변경", for: .normal)
        button2.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.black.cgColor
        button2.layer.cornerRadius = 6
        return button2
    }

    
    private func addComponents() {
        self.addSubview(ProfileImageView)
        self.addSubview(ProfileInfo)
        self.addSubview(UserEmail)
        self.addSubview(UseremailTextField)
        self.addSubview(Userpw)
        self.addSubview(UserpwTextField)
        self.addSubview(ChangeButton())
        self.addSubview(ChangeButton2())
    }
    
    // SnapKit을 이용한 제약 조건 설정
    private func setupConstraints() {
        ProfileImageView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.top.equalToSuperview().offset(144)
            make.leading.equalToSuperview().offset(151)
        }
        
        ProfileInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(254)
            make.leading.equalToSuperview().offset(27)
        }
        
        UserEmail.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(306)
            make.leading.equalToSuperview().offset(27)
        }
        
        UseremailTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(ProfileInfo.snp.bottom).offset(23)
        }
        
        Userpw.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(387)
            make.leading.equalToSuperview().offset(27)
        }
        
        UserpwTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(UseremailTextField.snp.bottom).offset(23)
        }
        
        ChangeButton().snp.makeConstraints { make in
            make.leading.equalTo(UseremailTextField.snp.trailing).offset(9)
            make.top.equalTo(UseremailTextField.snp.bottom).offset(8)
        }
        
        ChangeButton2().snp.makeConstraints { make in
            make.leading.equalTo(UserpwTextField.snp.trailing).offset(9)
            make.top.equalTo(UserpwTextField.snp.bottom).offset(8)
        }
    }
}
