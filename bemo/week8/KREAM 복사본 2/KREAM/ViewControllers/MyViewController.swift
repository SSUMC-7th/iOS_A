//
//  MyViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView
    }
    
    private lazy var myView:  MyView = {
        let view = MyView()
        view.editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        return view
    }()
    
    @objc
    private func editProfileButtonTapped(){
        let viewController = ProfileEditViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}
