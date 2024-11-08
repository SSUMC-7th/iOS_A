import UIKit

class MainHomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
        configureAppearance()
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
        
        // 탭 바에 뷰 컨트롤러 추가
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
    }

    /// 탭 바의 appearance 설정
    private func configureAppearance() {
        let barAppearance = UITabBarAppearance()
        
        // 선택된 상태의 아이콘 및 텍스트 색상
        barAppearance.stackedLayoutAppearance.selected.iconColor = .black
        barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        // 선택되지 않은 상태의 아이콘 및 텍스트 색상
        barAppearance.stackedLayoutAppearance.normal.iconColor = .gray
        barAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        // 탭 바 배경색 설정
        barAppearance.backgroundColor = .white

        // 스크롤 경계에서의 appearance 설정
        self.tabBar.standardAppearance = barAppearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = barAppearance
        }
    }
}

