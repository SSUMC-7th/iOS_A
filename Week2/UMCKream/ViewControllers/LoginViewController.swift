//
//  ViewController.swift
//  UMCKream
//
//  Created by 한태빈 on 9/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView = LoginView(frame: view.bounds)
        view.addSubview(loginView)
    }
}

