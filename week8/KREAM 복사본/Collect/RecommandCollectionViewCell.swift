//
//  SearchCollectionViewCell.swift
//  KREAM
//
//  Created by 한태빈 on 11/17/24.
//

import UIKit

class RecommandCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommandCollectionViewCell"
    
    let recommandButton = UIButton().then{
        $0.setTitle("채원 슈프림 후리스", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(recommandButton)
        recommandButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(123)
        }
    }
}
