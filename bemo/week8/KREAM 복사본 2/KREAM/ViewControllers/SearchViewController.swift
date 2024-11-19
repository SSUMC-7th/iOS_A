//
//  SearchViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/20/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = searchView

        // Do any additional setup after loading the view.
    }
    
    private lazy var searchView:  SearchView = {
        let view = SearchView()
        view.cancel.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        view.searchBar.addTarget(self, action: #selector(searchBarTapped), for: .editingDidBegin)
        return view
    }()
    
    @objc func cancelButtonTapped() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
        
    }
    
    @objc func searchBarTapped() {
        print("TextField tapped!")
        let searchDetailViewController = SearchDetailViewController()
        searchDetailViewController.modalPresentationStyle = .fullScreen
        present(searchDetailViewController, animated: true)
        
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
