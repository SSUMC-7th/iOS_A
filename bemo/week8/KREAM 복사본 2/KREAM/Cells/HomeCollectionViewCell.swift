//
//  HomeCollectionViewCell.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit
import Then

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11.5, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "크림 드로우"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HomeModel) {
            imageView.image = model.image
            titleLabel.text = model.name
        }
    
    private func setupView(){
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(61)
            $0.width.equalTo(61)

        }
        
        titleLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
