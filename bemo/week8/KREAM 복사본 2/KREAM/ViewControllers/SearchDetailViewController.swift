//
//  SearchDetailViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/20/24.
//

import UIKit

class SearchDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchDetailView

        // Do any additional setup after loading the view.
    }
    
    private lazy var searchDetailView:  SearchDetailView = {
        let view = SearchDetailView()
        view.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return view
    }()
    
    @objc func backButtonTapped() {
        let searchViewController = SearchViewController()
        searchViewController.modalPresentationStyle = .fullScreen
        present(searchViewController, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
