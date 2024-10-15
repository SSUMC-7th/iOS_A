import UIKit

/// 마이 페이지 뷰 컨트롤러
class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = myPageView
    }
    
    /// 커스텀한 마이페이지 뷰
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.ManageButton.addTarget(self, action: #selector(ManageButtonTapped), for: .touchUpInside)
        return view
    }()
    
    /// 프로필 관리 버튼을 통해 프로필 수정 페이지 이동
    @objc func ManageButtonTapped() {
        let changeVC = MyPageManageViewController()
        navigationController?.pushViewController(changeVC, animated: true)
    }
}
