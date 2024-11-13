
import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
    
    // UI 요소 선언
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10 // 이미지 둥글게 설정
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 초기화 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout() // 레이아웃 설정 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // 레이아웃 설정 메서드
    private func setupLayout() {
        // UI 요소를 셀의 콘텐츠 뷰에 추가
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(bookmarkButton)
        
        // SnapKit을 이용하여 레이아웃 설정
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(14)
            make.width.height.equalTo(72) // 이미지 크기 설정
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView)
            make.leading.equalTo(productImageView.snp.trailing).offset(13)
            make.trailing.equalTo(bookmarkButton.snp.leading).offset(-13)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(productImageView)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.top.equalTo(productImageView)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
    }
    
    // 셀에 데이터를 설정하는 메서드
    func configure(image: UIImage?, title: String, description: String, price: String) {
        productImageView.image = image
        titleLabel.text = title
        descriptionLabel.text = description
        priceLabel.text = price
    }
}
