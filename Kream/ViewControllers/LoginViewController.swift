import UIKit

class LoginViewController: UIViewController {
    

    let loginView = LoginView()
    let loginViewModel = LoginViewModel() // 뷰모델 인스턴스 생성


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

        // LoginView의 이메일 및 비밀번호 텍스트 필드 값 가져오기
        guard let email = loginView.emailTextField.text, !email.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            // 이메일 또는 비밀번호가 비어 있을 경우 경고 메시지 표시
            showAlert(title: "로그인 오류", message: "이메일과 비밀번호를 모두 입력해주세요.")
            return
        }
        
        // 로그인 정보를 UserDefaults에 저장
        loginViewModel.saveCredentials(email: email, password: password)
        
        // 로그인 성공 여부 확인 (임시로 저장된 값과 일치하는지 확인)
        if loginViewModel.login(email: email, password: password) {
            // 로그인 성공 시 메인 탭 화면으로 전환
            let mainTabBarController = MainTabBarController()
            mainTabBarController.modalPresentationStyle = .fullScreen // 전체 화면 모달 설정
            present(mainTabBarController, animated: true, completion: nil) // 모달 전환
        } else {
            // 로그인 실패 시 경고 메시지 표시
            showAlert(title: "로그인 실패", message: "이메일 또는 비밀번호가 올바르지 않습니다.")
        }
    }
    
    // 경고 메시지 표시 메서드
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)

        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen // 전체 화면 모달 설정
        present(mainTabBarController, animated: true, completion: nil) // 모달 전환

    }
}

