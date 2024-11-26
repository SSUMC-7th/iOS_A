//
//  JustDroppedCollectionViewCell‎.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedCollectionViewCell"
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
    }
    
    // 거래량 라벨
    let transactionCount = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(red: 64/255, green: 69/255, blue: 75/255, alpha: 1.0)
        $0.textAlignment = .center
    }
    
    // 북마크 버튼
    let saveButton = UIButton().then {
        $0.tintColor = UIColor.black
    }
    
    // 브랜드명 라벨
    let brandName = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    // 상품명 라벨
    let productName = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    // 가격 라벨
    let price = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
    }
    
    let nowBuyingLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // 서브뷰 추가
        [imageView,
         transactionCount,
         saveButton,
         brandName,
         productName,
         price,
         nowBuyingLabel]
            .forEach {
            addSubview($0)
        }
        
        // 레이아웃 설정
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(142)
            $0.width.equalTo(142)
        }
        
        transactionCount.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(8)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-8)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top).offset(112)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-10)
            $0.height.equalTo(20)
            $0.width.equalTo(22)
        }
        
        brandName.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        productName.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(3)
            $0.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        price.snp.makeConstraints {
            $0.top.equalTo(brandName.snp.bottom).offset(43)
            $0.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        nowBuyingLabel.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(2)
            $0.leading.equalTo(imageView.snp.leading).offset(4)
        }
    }
    
}
