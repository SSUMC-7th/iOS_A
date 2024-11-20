//
//  TabBarViewController.swift
//  Kream
//
//  Created by 임소은 on 10/4/24.
//
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let homeViewController = createNavController(for: MainViewController(), title: "HOME", image: UIImage(named: "home_icon")!)
        let styleViewController = createNavController(for: StyleViewController(), title: "STYLE", image: UIImage(named: "style_icon")!)
        let shopViewController = createNavController(for: ShopViewController(), title: "SHOP", image: UIImage(named: "shop_icon")!)
        let savedViewController = createNavController(for: SavedViewController(), title: "Saved", image: UIImage(named: "saved_icon")!)
        let myViewController = createNavController(for: MyViewController(), title: "My", image: UIImage(named: "mypage_icon")!)

        
        viewControllers = [homeViewController, styleViewController, shopViewController, savedViewController, myViewController]
        
        // 탭 바 스타일
        tabBar.tintColor = .gray
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
    }
    
    
    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
