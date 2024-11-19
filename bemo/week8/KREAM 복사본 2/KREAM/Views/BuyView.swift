//
//  buyView.swift
//  KREAM
//
//  Created by 임효진 on 11/9/24.
//

import UIKit

class BuyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buyLabel = UILabel().then {
        $0.text = "구매하기"
        $0.font = .systemFont(ofSize: 15, weight: .light)
        $0.textColor = .black
    }
    
    private let priceUnitLabel = UILabel().then {
        $0.text = "(가격 단위: 원)"
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .gray
    }
    
    private let titleLabl = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 14, weight: .light)
        $0.textColor = .black
    }
    
    private let discriptionLbael = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .gray
    }
    
    let productImage = UIImageView().then {
        $0.image = UIImage(named: "detailImage")
        $0.layer.cornerRadius = 8
    }
    
    private let sButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor
        
        let sizeLabel = UILabel().then {
            $0.text = "S"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        let priceLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .red
        }
        
        $0.addSubview(sizeLabel)
        $0.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
        }
    }
    
    private let mButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor
        
        let sizeLabel = UILabel().then {
            $0.text = "M"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        let priceLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .red
        }
        
        $0.addSubview(sizeLabel)
        $0.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
        }
    }
    
    private let lButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor
        
        let sizeLabel = UILabel().then {
            $0.text = "L"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        let priceLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .red
        }
        
        $0.addSubview(sizeLabel)
        $0.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
        }
    }
    
    private let xlButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor
        
        let sizeLabel = UILabel().then {
            $0.text = "XL"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        let priceLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .red
        }
        
        $0.addSubview(sizeLabel)
        $0.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
        }
    }
    
    private let xxlButton = UIButton().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0).cgColor
        
        let sizeLabel = UILabel().then {
            $0.text = "XXL"
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .black
        }
        
        let priceLabel = UILabel().then {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .red
        }
        
        $0.addSubview(sizeLabel)
        $0.addSubview(priceLabel)
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
        }
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "backButton"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }

    private func setupView(){
        
        addSubview(buyLabel)
        addSubview(priceUnitLabel)
        addSubview(titleLabl)
        addSubview(discriptionLbael)
        addSubview(productImage)
        addSubview(sButton)
        addSubview(mButton)
        addSubview(lButton)
        addSubview(xlButton)
        addSubview(xxlButton)
        addSubview(backButton)
        
        buyLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        priceUnitLabel.snp.makeConstraints {
            $0.top.equalTo(buyLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-16)
        }
        
        productImage.snp.makeConstraints {
            $0.top.equalTo(priceUnitLabel.snp.bottom).offset(11)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(91)
            $0.height.equalTo(91)
        }
        
        titleLabl.snp.makeConstraints {
            $0.top.equalTo(priceUnitLabel.snp.bottom).offset(29)
            $0.left.equalTo(productImage.snp.right).offset(15)
        }
        
        discriptionLbael.snp.makeConstraints {
            $0.top.equalTo(titleLabl.snp.bottom).offset(4)
            $0.left.equalTo(productImage.snp.right).offset(15)
        }
        
        sButton.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(35)
            $0.left.equalToSuperview().offset(15)
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        mButton.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        lButton.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(35)
            $0.right.equalToSuperview().offset(-15)
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        xlButton.snp.makeConstraints {
            $0.top.equalTo(sButton.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(15)
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
        
        xxlButton.snp.makeConstraints {
            $0.top.equalTo(mButton.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(47)
        }
    }

}
