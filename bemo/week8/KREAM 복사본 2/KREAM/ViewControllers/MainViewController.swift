//
//  MainViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class MainViewController: UITabBarController {

    private let homeVc = UINavigationController(rootViewController: HomeViewController())
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
        
        // 탭 바 스타일
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0).cgColor
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, CustomHeightTabBar.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class CustomHeightTabBar: UITabBar {
        override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 110
        return sizeThatFits
       }
    }

}
