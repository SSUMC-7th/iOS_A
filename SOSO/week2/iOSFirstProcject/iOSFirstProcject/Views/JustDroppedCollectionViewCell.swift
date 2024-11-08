import UIKit
import SnapKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
    static let identifier = "JustDroppedCollectionViewCell"

    private let imageView = UIImageView()
    private let brandLabel = UILabel()
    private let productLabel = UILabel()
    private let priceLabel = UILabel()
    private let transactionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(brandLabel)
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(transactionLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        productLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        transactionLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }

    // configure 메서드가 정의된 부분입니다.
    func configure(with model: JustDroppedModel) {
        imageView.image = model.image
        brandLabel.text = model.brandName
        productLabel.text = model.productName
        priceLabel.text = model.price
        transactionLabel.text = model.transactionCount
    }
}

