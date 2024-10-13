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

    // UI 요소들을 설정하는 함수
    private func createLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Pretendard", size: fontSize)
        label.textColor = .black
        return label
    }

    private func createTextField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = isSecure
        return textField
    }
    
    private func createChangeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard", size: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 6
        return button
    }

    
    private let ProfileInfo = UILabel()
    private let ProfileImageView = UIImageView()
    let idTextField = UITextField()
    let pwdTextField = UITextField()
    let ChangeButton1 = UIButton()
    let ChangeButton2 = UIButton()
    
    
    private func addComponents() {
        self.addSubview(ProfileImageView)
        self.addSubview(ProfileInfo)
        self.addSubview(idTextField)
        self.addSubview(pwdTextField)
        self.addSubview(ChangeButton1)
        self.addSubview(ChangeButton2)
    }
    
    // SnapKit을 이용한 제약 조건 설정
    private func setupConstraints() {
        ProfileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(144)
            make.leading.equalToSuperview().offset(151)
        }
        
        ProfileInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(254)
            make.leading.equalToSuperview().offset(27)
        }
        
        idTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(ProfileInfo.snp.bottom).offset(23)
        }
        
        pwdTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(27)
            make.top.equalTo(idTextField.snp.bottom).offset(23)
        }
        
        ChangeButton1.snp.makeConstraints { make in
            make.leading.equalTo(idTextField.snp.trailing).offset(9)
            make.top.equalTo(idTextField.snp.bottom).offset(8)
        }
        
        ChangeButton2.snp.makeConstraints { make in
            make.leading.equalTo(pwdTextField.snp.trailing).offset(9)
            make.top.equalTo(pwdTextField.snp.bottom).offset(8)
        }
    }
}
