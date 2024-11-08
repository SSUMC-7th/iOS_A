import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    let imageView = UIImageView()
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.height.width.equalTo(50) // 기본 크기 설정
        }

        titleLabel.font = .systemFont(ofSize: 10)
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            
        }
        
    }

    func configure(with item: HomeModel) {
        imageView.image = item.image
        titleLabel.text = item.title
    }
}

