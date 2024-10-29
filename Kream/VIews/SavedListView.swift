//
//  SavedView.swift
//  Kream
//
//  Created by 임소은 on 10/10/24.
//
import UIKit
import SnapKit

// 테이블 뷰가 포함된 View 클래스
class SavedListView: UIView {
    
    // 전체 아이템 개수를 표시하는 레이블
    let itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 0개"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    // 테이블 뷰 선언
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: "SavedCell")
        tableView.rowHeight = 100 // 셀의 높이 설정
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout() // 레이아웃 설정 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // 레이아웃 설정 메서드
    private func setupLayout() {
        // UI 요소를 뷰에 추가
        addSubview(itemCountLabel)
        addSubview(tableView)
        
        // SnapKit을 이용하여 레이아웃 설정
        itemCountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20) // 상단 여백
            make.leading.equalToSuperview().offset(16) // 좌측 여백
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(itemCountLabel.snp.bottom).offset(16) // 아이템 개수 레이블 아래에 위치
            make.leading.trailing.bottom.equalToSuperview() // 테이블 뷰를 화면 전체에 맞춤
        }
    }
}

