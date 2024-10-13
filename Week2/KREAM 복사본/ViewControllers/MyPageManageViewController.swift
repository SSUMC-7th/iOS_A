import UIKit

/// 프로필 관리 페이지 뷰 컨트롤러
class MyPageManageViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = manageProfilePageview
        setNavigation()
    }
    
    
    private lazy var manageProfilePageview: ManageProfilePageView = {
        let view = ManageProfilePageView()
        view.ChangeButton1.addTarget(self, action: #selector(changeButton1Tapped), for: .touchUpInside)
        view.ChangeButton2.addTarget(self, action: #selector(changeButton2Tapped), for: .touchUpInside)
        return view
    }()
    
    // 네비게이션 설정
    private func setNavigation() {
        self.navigationItem.title = "프로필 관리"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBtn
    }
    
    
    /// 네비게이션 왼쪽 상단 버튼 액션
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func changeButton1Tapped() {
        // ChangeButton1 눌렸을 때의 동작
        print("ChangeButton1 눌림")
    }
    
    @objc func changeButton2Tapped() {
        // ChangeButton2 눌렸을 때의 동작
        print("ChangeButton2 눌림")
    }
}
