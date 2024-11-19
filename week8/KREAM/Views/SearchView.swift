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

    private let searchBar = UILabel().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont(name: "Pretendard", size: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor = UIColor.systemGray5
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
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


    private func addComponents() {
        self.addSubview(searchBar)
        self.addSubview(cancelButton)
        self.addSubview(searchRecommendation)
        
        
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
        
        
    }
}
