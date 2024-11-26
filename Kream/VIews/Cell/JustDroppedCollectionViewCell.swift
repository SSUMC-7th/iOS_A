import UIKit
import SnapKit
import Kingfisher

class JustDroppedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "JustDroppedCell" // 셀 식별자 추가
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let bookmarkButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "bookmark")
        configuration.baseForegroundColor = .black

        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)

        // 클릭 시 하이라이트 효과 제거
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            if button.isHighlighted {
                config?.baseBackgroundColor = .clear // 하이라이트 시에도 배경색 변경 없이 유지
                button.alpha = 1.0 // 알파값 조정으로 시각적인 효과 제거
            }
            button.configuration = config
        }

        return button
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 2 // 최대 2줄로 설정
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    let purchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(bookmarkButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(purchaseInfoLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(142)
        }

        bookmarkButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(-8)
            make.trailing.equalTo(imageView.snp.trailing).offset(-8)
            make.width.height.equalTo(20)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        purchaseInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    @objc func bookmarkButtonTapped() {
        bookmarkButton.isSelected.toggle()
        let imageName = bookmarkButton.isSelected ? "bookmark.fill" : "bookmark"
        let icon = UIImage(systemName: imageName)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bookmarkButton.setImage(icon, for: .normal)
    }
    
    func configure(with item: JustDroppedItem) {
        // Kingfisher를 사용해 URL로 이미지 로드
        if let url = URL(string: item.imageUrl) {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil // URL이 유효하지 않으면 기본 이미지 처리
        }
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        priceLabel.text = item.price
        purchaseInfoLabel.text = item.purchaseInfo
    }
}

