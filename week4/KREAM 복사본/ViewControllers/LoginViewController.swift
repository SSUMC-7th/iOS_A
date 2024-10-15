import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }

    private lazy var loginView: LoginView = {
        let view = LoginView()
        // 버튼 액션 추가
        view.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
        view.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonTapped), for: .touchUpInside)
        return view
    }()

    // 로그인 버튼 눌렀을 때 탭바로 이동
    @objc func loginButtonTapped() {
        print("로그인 버튼 눌림")
        let tabBarVC = TabarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }

    // 카카오 로그인 버튼 액션
    @objc func kakaoLoginButtonTapped() {
        print("카카오로 로그인 버튼 눌림")
        let tabBarVC = TabarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }

    // 애플 로그인 버튼 액션
    @objc func appleLoginButtonTapped() {
        print("애플로 로그인 버튼 눌림")
        let tabBarVC = TabarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}
