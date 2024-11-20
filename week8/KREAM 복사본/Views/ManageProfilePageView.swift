import UIKit

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

    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFit
    }

    private let profileInfo = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = UIFont(name: "Pretendard", size: 18)
        $0.textColor = .black
    }

    private let userEmail = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = UIFont(name: "Pretendard", size: 14)
        $0.textColor = .black
    }

    private let userEmailTextField = UITextField().then {
        $0.placeholder = "taebin325@gmail.com"
        $0.borderStyle = .roundedRect
        $0.font = UIFont(name: "Pretendard", size: 14)
        $0.textColor = .black
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }

    private let userPw = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = UIFont(name: "Pretendard", size: 14)
        $0.textColor = .black
    }

    private let userPwTextField = UITextField().then {
        $0.placeholder = "qpalzm()"
        $0.borderStyle = .roundedRect
        $0.font = UIFont(name: "Pretendard", size: 14)
        $0.textColor = .black
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }

    // 변경 버튼을 프로퍼티로 정의 (internal로 설정하여 ViewController에서 접근 가능)
    let changeButton = UIButton(type: .system).then {
        $0.setTitle("변경", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 6
    }

    let changeButton2 = UIButton(type: .system).then {
        $0.setTitle("변경", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 6
    }

    private func addComponents() {
        [profileImageView, profileInfo, userEmail, userEmailTextField, userPw, userPwTextField, changeButton, changeButton2].forEach {
            self.addSubview($0)
        }
    }

    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(90)
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
            make.top.equalTo(userEmailTextField.snp.top)
        }

        changeButton2.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(58)
            make.leading.equalTo(userPwTextField.snp.trailing).offset(9)
            make.top.equalTo(userPwTextField.snp.top)
        }
    }
}

