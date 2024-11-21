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
    
    func setupView(){
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(53)
            $0.width.equalTo(53)
            
        }
    }
}
