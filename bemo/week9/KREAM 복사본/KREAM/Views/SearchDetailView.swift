//
//  SearchDetailView.swift
//  KREAM
//
//  Created by 임효진 on 11/20/24.
//

import UIKit

class SearchDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let searchBar = UITextField().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor =  UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        $0.leftViewMode = .always
        
    }
    
    let cancel = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "backButton"), for: .normal)
    }
    
    private func addComponents() {
        self.addSubview(searchBar)
        self.addSubview(cancel)
        self.addSubview(backButton)
        
        backButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(15)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
            $0.top.equalToSuperview().offset(51)
        }
        
        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.leading.equalTo(backButton.snp.trailing).offset(16)
        }
        
        cancel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(17)
            $0.right.equalToSuperview().offset(-16)
        }
    }

}
