//
//  ViewController.swift
//  iOSFirstProject
//
//  Created by 소민준 on 9/28/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView()
        view.addSubview(loginView)
        loginView.snp.makeConstraints{ make in make.edges.equalToSuperview()
        }
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTouch), for: .touchUpInside)
        }
        
    
    
        
    @objc private func loginButtonTouch(){
        let viewController = MainHomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
}


