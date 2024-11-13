import UIKit
import SnapKit

class PurchaseSheetViewController: UIViewController {
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeSheet), for: .touchUpInside)
        return button
    }()
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "matinKim")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let productSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "마틴킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    var sizeButtons: [UIButton] = []
    let sizes = ["S", "M", "L", "XL", "XXL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(closeButton)
        view.addSubview(productImageView)
        view.addSubview(productTitleLabel)
        view.addSubview(productSubtitleLabel)
        
        let titleLabel = UILabel()
           titleLabel.text = "구매하기"
           titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
           
           let subtitleLabel = UILabel()
           subtitleLabel.text = "(가격 단위: 원)"
           subtitleLabel.font = UIFont.systemFont(ofSize: 14)
           subtitleLabel.textColor = .gray
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.top)
            make.centerX.equalToSuperview()
            }
            
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(91)
        }
        
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(29)
            make.leading.equalTo(productImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(16)
        }
        
        productSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(productTitleLabel.snp.leading)
            make.trailing.equalTo(productTitleLabel.snp.trailing)
        }
        
        // 사이즈 버튼 생성 및 추가
        createSizeButtons()
    }
    
    func createSizeButtons() {
        let buttonContainerView = UIView()
        var lastButton: UIButton? = nil
        var rowCounter = 0
        
        for size in sizes {
            let button = UIButton(type: .system)
            button.setTitle(size, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 8
            button.backgroundColor = .white // 기본 배경색
            
            button.snp.makeConstraints { make in
                make.width.equalTo(110)
                make.height.equalTo(47)
            }
            
           
            sizeButtons.append(button)
            buttonContainerView.addSubview(button)
            
            button.snp.makeConstraints { make in
                if let lastButton = lastButton {
                    if rowCounter < 3 {
                        // 같은 줄에 배치
                        make.leading.equalTo(lastButton.snp.trailing).offset(8)
                        make.top.equalTo(lastButton.snp.top)
                        rowCounter += 1
                    } else {
                        // 새 줄에 배치
                        make.top.equalTo(lastButton.snp.bottom).offset(8)
                        make.leading.equalToSuperview()
                        rowCounter = 0
                    }
                } else {
                    // 첫 번째 버튼 배치
                    make.top.leading.equalToSuperview()
                    rowCounter += 1
                }
            }
            
            
            lastButton = button
        }
        
        view.addSubview(buttonContainerView)
        buttonContainerView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    @objc func closeSheet() {
        dismiss(animated: true, completion: nil)
    }
    @objc func sizeButtonTapped(_ sender: UIButton) {
           // 모든 버튼을 초기 상태로 되돌림
           sizeButtons.forEach { button in
               button.layer.borderWidth = 1
               button.layer.borderColor = UIColor.lightGray.cgColor
               button.backgroundColor = .white
           }
           
           // 선택된 버튼을 강조
           sender.layer.borderWidth = 2
           sender.layer.borderColor = UIColor.black.cgColor
       }
   
}

