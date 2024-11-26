//
//  SearchView.swift
//  KREAM
//
//  Created by 임효진 on 11/20/24.
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
    
    let searchBar = UITextField().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor =  UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        $0.leftViewMode = .always
        
    }
    
    let recommendWord = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.text = "추천 검색어"
    }
    
    let cancel = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    private let button1 = UIButton().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.setTitle("채원 슈프림 후리스", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private let button2 = UIButton().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.setTitle("나이키V2K런", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private let button3 = UIButton().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.setTitle("뉴발란스996", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private let button4 = UIButton().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 20
        $0.setTitle("신상 나이키 콜라보", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11)
    }
    
    private func addComponents() {
        self.addSubview(searchBar)
        self.addSubview(cancel)
        self.addSubview(recommendWord)
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        self.addSubview(button4)
        
        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
        }
        
        cancel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(17)
            $0.right.equalToSuperview().offset(-16)
        }
        
        recommendWord.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(41)
            $0.leading.equalToSuperview().offset(16)
        }
        
        button1.snp.makeConstraints{
            $0.top.equalTo(recommendWord.snp.bottom).offset(11)
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().offset(16)
        }
        
        button2.snp.makeConstraints{
            $0.top.equalTo(recommendWord.snp.bottom).offset(11)
            $0.height.equalTo(32)
            $0.leading.equalTo(button1.snp.trailing).offset(8)
        }
        
        button3.snp.makeConstraints{
            $0.top.equalTo(recommendWord.snp.bottom).offset(11)
            $0.height.equalTo(32)
            $0.leading.equalTo(button2.snp.trailing).offset(8)
        }
        
        button4.snp.makeConstraints{
            $0.top.equalTo(button1.snp.bottom).offset(12)
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().offset(16)
        }
    }

}
