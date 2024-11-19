//
//  MatinKimCollectionViewCell.swift
//  KREAM
//
//  Created by 한태빈 on 11/9/24.
//

import UIKit

class MatinKimCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MatinKimCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(53)
            make.width.equalTo(53)
        }
    }
}
