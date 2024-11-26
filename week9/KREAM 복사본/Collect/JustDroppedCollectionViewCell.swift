import UIKit
import Kingfisher

class JustDroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "JustDroppedCollectionViewCell" // 셀 식별자

    private var model: JustDroppedModel? // 모델 저장
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    // 거래량 라벨
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = UIColor(red: 64/255, green: 69/255, blue: 75/255, alpha: 1.0)
        $0.textAlignment = .center
    }
    
    // 북마크 버튼
    let saveButton = UIButton().then {
        $0.tintColor = UIColor.black
    }
    
    // 브랜드명 라벨
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .black
    }
    
    // 상품명 라벨
    let productLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    // 가격 라벨
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .black
    }
    
    // 즉시 구매 라벨
    let nowBuyingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // 서브뷰 추가
        [imageView, titleLabel, saveButton, brandLabel, productLabel, priceLabel, nowBuyingLabel].forEach {
            contentView.addSubview($0)
        }
        
        // 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(142)
            make.width.equalTo(142)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(8)
            make.trailing.equalTo(imageView.snp.trailing).offset(-8)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(112)
            make.trailing.equalTo(imageView.snp.trailing).offset(-10)
            make.height.equalTo(20)
            make.width.equalTo(22)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        productLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(3)
            make.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(8)
            make.leading.equalTo(imageView.snp.leading).offset(4)
        }
        
        nowBuyingLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.equalTo(imageView.snp.leading).offset(4)
        }
    }
    
    private func setupActions() {
        // 북마크 버튼에 액션 추가
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
    }
    
    // MARK: - Configure Cell
    func configure(with model: JustDroppedModel) {
        self.model = model
        
        // 이미지 설정
        if let imageUrl = model.image {
            imageView.kf.setImage(with: imageUrl)
        } else {
            imageView.image = UIImage(named: "placeholder")
        }
        
        // 라벨 설정
        titleLabel.text = model.transactionCount
        brandLabel.text = model.brandName
        productLabel.text = model.productName
        priceLabel.text = model.price
        nowBuyingLabel.text = model.buyNowLabel
        
        // 북마크 상태 업데이트
        updateBookmarkState()
    }
    
    private func updateBookmarkState() {
        guard let model = model else { return }
        
        // 북마크 상태에 따라 아이콘 변경
        let iconName = model.isBookmarked ? "bookmark.fill" : "bookmark"
        saveButton.setImage(UIImage(systemName: iconName), for: .normal)
    }
    
    @objc private func didTapSaveButton() {
        guard var model = model else { return }
        
        // 북마크 상태 토글
        model.isBookmarked.toggle()
        self.model = model
        
        // 북마크 상태 업데이트
        updateBookmarkState()
    }
}
