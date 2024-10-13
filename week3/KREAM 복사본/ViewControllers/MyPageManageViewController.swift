import UIKit

/// 프로필 관리 페이지 뷰 컨트롤러
class MyPageManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = manageProfilePageView
        setNavigation()
    }

    // lazy로 관리되는 커스텀 뷰, 버튼 액션을 연결함
    private lazy var manageProfilePageView: ManageProfilePageView = {
        let view = ManageProfilePageView()
        view.changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        view.changeButton2.addTarget(self, action: #selector(changeButton2Tapped), for: .touchUpInside)
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

    @objc func changeButtonTapped() {
        // ChangeButton1 눌렸을 때의 동작
        print("ChangeButton 눌림")
    }

    @objc func changeButton2Tapped() {
        // ChangeButton2 눌렸을 때의 동작
        print("ChangeButton2 눌림")
    }
}
