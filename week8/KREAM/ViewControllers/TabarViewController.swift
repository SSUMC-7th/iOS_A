import UIKit

// UIImage 확장: 이미지를 크기에 맞게 리사이즈하는 메서드 추가
extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

class TabarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let HomeVC = UINavigationController(rootViewController: HomeViewController())
        let homeImage = UIImage(named: "home")?.resize(to: CGSize(width: 26, height: 26))
        HomeVC.tabBarItem = UITabBarItem(title: "HOME", image: homeImage, tag: 0)
        
        let StyleVC = UINavigationController(rootViewController: StyleViewController())
        let styleImage = UIImage(named: "style")?.resize(to: CGSize(width: 27, height: 26))
        StyleVC.tabBarItem = UITabBarItem(title: "STYLE", image: styleImage, tag: 1)
        
        let ShopVC = UINavigationController(rootViewController: ShopViewController())
        let shopImage = UIImage(named: "shop")?.resize(to: CGSize(width: 31, height: 31))
        ShopVC.tabBarItem = UITabBarItem(title: "SHOP", image: shopImage, tag: 2)
        
        let SavedVC = UINavigationController(rootViewController: SavedViewController())
        let savedImage = UIImage(named: "saved")?.resize(to: CGSize(width: 28, height: 26))
        SavedVC.tabBarItem = UITabBarItem(title: "SAVED", image: savedImage, tag: 3)
        
        let MyVC = UINavigationController(rootViewController: MyPageViewController())
        let myImage = UIImage(named: "my")?.resize(to: CGSize(width: 29, height: 26))
        MyVC.tabBarItem = UITabBarItem(title: "MY", image: myImage, tag: 4)
        
        self.viewControllers = [HomeVC, StyleVC, ShopVC, SavedVC, MyVC]
        appearance()
    }
    
    private func appearance() {
        let tabarAppearance = UITabBarAppearance()
        tabarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        tabarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        tabarAppearance.stackedLayoutAppearance.selected.badgeBackgroundColor = UIColor.black
        tabarAppearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor.black
        
        self.tabBar.standardAppearance = tabarAppearance
        self.tabBar.backgroundColor = .white
    }
}
