import UIKit
import SnapKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    
    // 이미지 뷰 설정
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30.5  // 이미지 뷰 크기의 절반으로 설정해 원형으로 만듦
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // 레이블 설정
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        // 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(61) // 원형 이미지 크기 설정
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 셀 데이터 구성
    func configure(imageName: String, title: String) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = title
    }
}
