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

    private let profileImageView: UIImageView = {
        let profile = UIImageView()
        profile.image = UIImage(named: "profile")
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.contentMode = .scaleAspectFit
        return profile
    }()

    private let profileInfo: UILabel = {
        let info = UILabel()
        info.text = "프로필 정보"
        info.font = UIFont(name: "Pretendard", size: 18)
        info.textColor = .black
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()

    private let userEmail: UILabel = {
        let mail = UILabel()
        mail.text = "유저 이메일"
        mail.font = UIFont(name: "Pretendard", size: 14)
        mail.textColor = .black
        mail.translatesAutoresizingMaskIntoConstraints = false
        return mail
    }()

    private let userEmailTextField: UITextField = {
        let mailText = UITextField()
        mailText.placeholder = "taebin325@gmail.com"
        mailText.borderStyle = .roundedRect
        mailText.font = UIFont(name: "Pretendard", size: 14)
        mailText.textColor = .black
        mailText.layer.cornerRadius = 10
        mailText.layer.borderWidth = 1
        mailText.layer.borderColor = UIColor.lightGray.cgColor
        mailText.translatesAutoresizingMaskIntoConstraints = false
        return mailText
    }()

    private let userPw: UILabel = {
        let pw = UILabel()
        pw.text = "유저 비밀번호"
        pw.font = UIFont(name: "Pretendard", size: 14)
        pw.textColor = .black
        pw.translatesAutoresizingMaskIntoConstraints = false
        return pw
    }()

    private let userPwTextField: UITextField = {
        let pwText = UITextField()
        pwText.placeholder = "qpalzm()"
        pwText.borderStyle = .roundedRect
        pwText.font = UIFont(name: "Pretendard", size: 14)
        pwText.textColor = .black
        pwText.layer.cornerRadius = 10
        pwText.layer.borderWidth = 1
        pwText.layer.borderColor = UIColor.lightGray.cgColor
        pwText.translatesAutoresizingMaskIntoConstraints = false
        return pwText
    }()

    // 변경 버튼을 프로퍼티로 정의 (internal로 설정하여 ViewController에서 접근 가능)
    let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        return button
    }()

    let changeButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        return button
    }()

    private func addComponents() {
        self.addSubview(profileImageView)
        self.addSubview(profileInfo)
        self.addSubview(userEmail)
        self.addSubview(userEmailTextField)
        self.addSubview(userPw)
        self.addSubview(userPwTextField)
        self.addSubview(changeButton)
        self.addSubview(changeButton2)
    }

    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(90)
            make.top.equalToSuperview().offset(144)
            make.leading.equalToSuperview().offset(151)
        }

        profileInfo.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(27)
        }

        userEmail.snp.makeConstraints { make in
            make.top.equalTo(profileInfo.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(27)
        }

        userEmailTextField.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(282)
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(userEmail.snp.bottom).offset(4)
        }

        userPw.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(27)
        }

        userPwTextField.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(282)
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(userPw.snp.bottom).offset(4)
        }

        changeButton.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(58)
            make.leading.equalTo(userEmailTextField.snp.trailing).offset(9)
            make.top.equalTo(userEmailTextField.snp.top).offset(0)
        }

        changeButton2.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(58)
            make.leading.equalTo(userPwTextField.snp.trailing).offset(9)
            make.top.equalTo(userPwTextField.snp.top).offset(0)
        }
    }
}
