//
//  BuyViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/9/24.
//

import UIKit

class BuyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = buyView
        
        setupAction()
    }
    
    private lazy var buyView:  BuyView = {
        let view = BuyView()
        return view
    }()
    
    private func setupAction() {
        buyView.backButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
