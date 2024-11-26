//
//  SearchView.swift
//  KREAM
//
//  Created by 한태빈 on 11/17/24.
//

import UIKit

class SearchinView: UIView {

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
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = ""
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }


    let cancelButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    

    private func addComponents() {
        self.addSubview(searchBar)
        self.addSubview(cancelButton)
        
        
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
        


        
    }
}
