//
//  TabBarViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit
class MainHomeViewController: UITabBarController{
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            setupTabBar()
            appearance()
        }
        
        
        /// 탭바 설정 함수(피그마 디자인에 맞춰 5개 구성)
        private func setupTabBar() {
            
            let homeVC = UINavigationController(rootViewController: HomeViewController())
            homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "home"), tag: 1)
            
            let StyleVC = UINavigationController(rootViewController: StyleViewController())
            StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "style"), tag: 2)
            
            let ShopVC = UINavigationController(rootViewController: ShopViewController())
            ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "search"), tag: 3)
            
            let SavedVC = UINavigationController(rootViewController: SavedViewController())
            SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "saved"), tag: 4)
            
            let MyVC = UINavigationController(rootViewController: MyPageViewController())
            MyVC.tabBarItem = UITabBarItem(title: "My", image: UIImage(named: "my"), tag: 5)
            
            self.viewControllers = [homeVC, StyleVC, ShopVC, SavedVC, MyVC]
            
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


