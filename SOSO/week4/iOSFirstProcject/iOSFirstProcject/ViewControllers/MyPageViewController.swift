//
//  MyPageViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        // Do any additional setup after loading the view.
    }
    

    private lazy var myPageView: MyPageView = {
            let view = MyPageView()
            view.topView.profileManageBtn.addTarget(self, action: #selector(changePage), for: .touchUpInside)
            return view
        }()
        
        /// 프로필 관리 버튼을 통해 프로필 수정 페이지 이동
        @objc func changePage() {
            let changeVC = MyPageManageViewController()
            navigationController?.pushViewController(changeVC, animated: true)
        }
    }
