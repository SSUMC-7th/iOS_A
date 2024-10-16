//
//  SavedViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit

/// Saved 뷰 컨트롤러
class SavedViewController: UIViewController {
    
    // 데이터 모델
    let data = SavedProductData.datalist

    // SavedView 인스턴스 생성
    private lazy var savedView = SavedView(productCount: data.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // 뷰 및 테이블 뷰 설정
    private func setupView() {
        self.view = savedView
        savedView.tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        savedView.tableView.delegate = self
        savedView.tableView.dataSource = self
    }
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션의 행 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        return cell
    }
}
