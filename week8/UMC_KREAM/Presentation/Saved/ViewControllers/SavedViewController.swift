//
//  SavedViewController.swift
//  UMC_KREAM
//
//  Created by 소민준 on 11/20/24.
//

import UIKit

class SavedViewController: UIViewController {

    let data = SavedProductData.datalist

       override func viewDidLoad() {
           super.viewDidLoad()
           self.view = savedView
       }
       
       private lazy var savedView: SavedView = {
           let savedView = SavedView(productCount: data.count)
           savedView.tableView.delegate = self
           savedView.tableView.dataSource = self
           return savedView
       }()
   }

   //MARK: - Extension

   /* 테이블 뷰 내부 속성 조정 */
   extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           data.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
               return UITableViewCell()
           }
           
           cell.configure(model: data[indexPath.row])
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }

       
   }
