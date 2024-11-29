//
//  SavedViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class SavedViewController: UIViewController {

    let data = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        view.tableView.dataSource = self
        view.countLabel.text = "전체 \(data.count) 개"
        return view
    }()

}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }

}
