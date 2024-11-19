//
//  OtherColorsCollectionVIewCell.swift
//  KREAM
//
//  Created by 임효진 on 11/8/24.
//

import UIKit

class OtherColorsCollectionViewCell: UICollectionViewCell {

    static let identifier = "OtherColorsCollectionViewCell"

    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private func setupView() {
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
