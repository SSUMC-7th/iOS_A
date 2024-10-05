//
//  MainViewController.swift
//  KREAM
//
//  Created by 임효진 on 10/6/24.
//

import UIKit

class MainViewController: UITabBarController {
    
    private let homeVc = HomeViewController()
    private let styleVc = StyleViewController()
    private let shopVc = ShopViewController()
    private let savedVc = SavedViewController()
    private let myVc = UINavigationController(rootViewController: MyViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeVc.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Home"), tag: 0)
        styleVc.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Style"), tag: 0)
        shopVc.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Shop"), tag: 0)
        savedVc.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "Saved"), tag: 0)
        myVc.tabBarItem = UITabBarItem(title: " ", image: UIImage(named: "My"), tag: 0)
        
        self.viewControllers = [homeVc, styleVc, shopVc, savedVc, myVc]
    }
    

}
