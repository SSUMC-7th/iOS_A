//
//  HomeCollectionViewCell.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/15/24.
//



import UIKit
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    // 이미지와 레이블 설정
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 이미지 뷰 설정
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        // 레이블 설정
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        // SnapKit을 이용한 이미지 뷰와 레이블 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(61) // 피그마 기준 크기 설정
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5) // 이미지와 텍스트 간 간격
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(with item: HomeModel) {
        imageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
    }
}
