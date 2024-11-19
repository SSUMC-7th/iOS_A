//
//  ProductDetailView.swift
//  KREAM
//
//  Created by 임효진 on 11/8/24.
//

import UIKit

class ProductDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let detailImage = UIImageView().then {
        $0.image = UIImage(named: "detailImage")
        $0.contentMode = .scaleAspectFit
    }
    
    let otherColorsColletionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 8 //가로 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(OtherColorsCollectionViewCell.self, forCellWithReuseIdentifier: OtherColorsCollectionViewCell.identifier)
    }
    
    private let nowBuyingLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .black
    }
    
    private let discroptionLabel = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1.0)
    }
    
    private let saveButton = UIButton().then {
        $0.setImage(UIImage(named: "save_icon"), for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let savedCount = UILabel().then {
        $0.text = "2,122"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    let buyButton = UIButton().then {
        let priceLabel = UILabel().then {
            $0.text = "345,000"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 13)
        }
        
        let buy = UILabel().then {
            $0.text = "구매"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
        
        let nowBuy = UILabel().then {
            $0.text = "즉시 구매가"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = UIColor(red: 163/255, green: 55/255, blue: 25/255, alpha: 1.0)
        }
        
        $0.addSubview(priceLabel)
        $0.addSubview(buy)
        $0.addSubview(nowBuy)
        $0.backgroundColor = UIColor(red: 239/255, green: 98/255, blue: 84/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        buy.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(10)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(buy.snp.right).offset(21)
        }
        
        nowBuy.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.left.equalTo(buy.snp.right).offset(21)
        }
    }
    
    private let saleButton = UIButton().then {
        let priceLabel = UILabel().then {
            $0.text = "396,000"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 13)
        }
        
        let sale = UILabel().then {
            $0.text = "판매"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
        
        let nowSale = UILabel().then {
            $0.text = "즉시 판매가"
            $0.font = .systemFont(ofSize: 10)
            $0.textColor = UIColor(red: 31/255, green: 119/255, blue: 69/255, alpha: 1.0)
        }
        
        $0.addSubview(priceLabel)
        $0.addSubview(sale)
        $0.addSubview(nowSale)
        $0.backgroundColor = UIColor(red: 65/255, green: 185/255, blue: 122/255, alpha: 1.0)
        $0.layer.cornerRadius = 10
        
        sale.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(10)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.left.equalTo(sale.snp.right).offset(21)
        }
        
        nowSale.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.left.equalTo(sale.snp.right).offset(21)
        }
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    private let contentView = UIView()
    
    private func setupView(){
        
        addSubview(scrollView)
        addSubview(divideLine)
        addSubview(saveButton)
        addSubview(savedCount)
        addSubview(buyButton)
        addSubview(saleButton)
        
        divideLine.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(185)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview()
            
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(divideLine.snp.top)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(15)
            $0.left.equalToSuperview().offset(21)
            
        }
        
        savedCount.snp.makeConstraints {
            $0.top.equalTo(saveButton.snp.bottom)
            $0.left.equalToSuperview().offset(21)
            
        }
        
        buyButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.left.equalTo(savedCount.snp.right).offset(26)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
            
        }
        
        saleButton.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(8)
            $0.right.equalToSuperview().inset(10)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
            
        }
        
        scrollView.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(800)
        }
        
        [
            detailImage,
            otherColorsColletionView,
            nowBuyingLabel,
            priceLabel,
            titleLabel,
            discroptionLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        detailImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(93)
            $0.height.equalTo(373)
            $0.width.equalTo(374)
        }
        
        otherColorsColletionView.snp.makeConstraints{
            $0.top.equalTo(detailImage.snp.bottom).offset(20)
            $0.height.equalTo(53)
            $0.left.right.equalToSuperview()
        }
        
        nowBuyingLabel.snp.makeConstraints{
            $0.top.equalTo(otherColorsColletionView.snp.bottom).offset(23)
            $0.left.equalToSuperview().offset(16)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(nowBuyingLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.left.equalToSuperview().offset(16)
        }
        
        discroptionLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.left.equalToSuperview().offset(16)
        }
    }
}
