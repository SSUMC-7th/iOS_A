//
//  SearchView.swift
//  KREAM
//
//  Created by 한태빈 on 11/17/24.
//

import UIKit

class SearchView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let searchBar = UISearchBar().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBarStyle = .minimal
        $0.clipsToBounds = true

        if let textField = $0.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.lightGray // 텍스트 색상 설정
            textField.backgroundColor = UIColor.systemGray5 // 텍스트 필드 배경색 설정
        }
    }


    let searchRecommendation = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.text = "추천 검색어"
    }

    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    let RecommandCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 123, height: 32)
        $0.minimumInteritemSpacing = 8
        $0.minimumLineSpacing = 12
    }).then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.isScrollEnabled = false
        $0.register(RecommandCollectionViewCell.self, forCellWithReuseIdentifier: RecommandCollectionViewCell.identifier)
    }

    private func addComponents() {
        self.addSubview(searchBar)
        self.addSubview(cancelButton)
        self.addSubview(searchRecommendation)
        self.addSubview(RecommandCollectionView)
        
        
        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
        }
        
        cancelButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(17)
            $0.right.equalToSuperview().offset(-16)
        }
        
        searchRecommendation.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(41)
            $0.leading.equalToSuperview().offset(16)
        }
        RecommandCollectionView.snp.makeConstraints{
            $0.top.equalTo(searchRecommendation.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(76)
        }
        
        
    }
}
