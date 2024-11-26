import UIKit
import SnapKit

class ChallengeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChallengeCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // 이미지가 꽉 차게
        imageView.clipsToBounds = true // 셀의 경계를 넘지 않도록
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left // 왼쪽 정렬
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        // 오토레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview() // 셀 크기에 맞게 이미지 확장
            make.height.equalTo(165) // 이미지 높이 설정
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8) // 이미지 아래에 배치
            make.leading.trailing.equalToSuperview().inset(4) // 텍스트 좌우 여백
            make.height.equalTo(16) // 텍스트 높이 설정
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 데이터 설정 메서드
    func configure(imageName: String, title: String) {
        imageView.image = UIImage(named: imageName) // 이미지 설정
        titleLabel.text = title // 텍스트 설정
    }
}

