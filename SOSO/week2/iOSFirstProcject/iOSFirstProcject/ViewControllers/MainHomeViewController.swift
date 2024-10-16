//
//  TabBarViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit

class MainHomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
        appearance()
    }

    /// 탭바 설정 함수
    private func setupTabBar() {
        // HomeViewController는 첫 번째 탭
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 1)
        
        let styleVC = UINavigationController(rootViewController: StyleViewController())
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 2)
        
        let shopVC = UINavigationController(rootViewController: ShopViewController())
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "search"), tag: 3)
        
        let savedVC = UINavigationController(rootViewController: SavedViewController())
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 4)
        
        let myVC = UINavigationController(rootViewController: MyPageViewController())
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "my"), tag: 5)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
    }

    private func appearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        barAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        barAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = barAppearance
        self.tabBar.backgroundColor = .clear
    }
}
