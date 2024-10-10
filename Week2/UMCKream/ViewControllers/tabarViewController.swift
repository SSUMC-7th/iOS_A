//
//  tabarViewController.swift
//  UMCKream
//
//  Created by 한태빈 on 10/5/24.
//

import UIKit
class TabarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HomeVC = HomeViewController()
        HomeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 0)
        
        let StyleVC = StyleViewController()
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 1)
        
        let ShopVC = ShopViewController()
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "shop"), tag: 2)
        
        let SavedVC = SavedViewController()
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 3)
        let MyVC = UINavigationController(rootViewController: MyViewController())
        MyVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "my"), tag: 4)
        self.viewControllers = [HomeVC, StyleVC, ShopVC, SavedVC, MyVC]
    }
    
    
}
