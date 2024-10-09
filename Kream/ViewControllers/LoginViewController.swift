import UIKit

class LoginViewController: UIViewController {
    
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // LoginView를 뷰에 추가
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)
        
        // LoginView AutoLayout 설정
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // 로그인 버튼에 액션 추가
        loginView.loginButton.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 클릭 시 호출되는 메서드
    @objc func handleLoginButtonTapped() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen // 전체 화면 모달 설정
        present(mainTabBarController, animated: true, completion: nil) // 모달 전환
    }
}

