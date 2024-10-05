//
//  ProfileEditViewController.swift
//  KREAM
//
//  Created by 임효진 on 10/6/24.
//

import UIKit

class ProfileEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ProfileEditView()

        // Do any additional setup after loading the view.
    }
    
    @objc
    private func editProfileButtonTapped(){
        let viewController = ProfileEditViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }

}
