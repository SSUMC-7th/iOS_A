import Foundation

soonny/week4]-4주차-과제
class LoginViewModel {
    
    // UserDefaults에 저장할 키 정의
    private let emailKey = "userEmail"
    private let passwordKey = "userPassword"
    
    // 저장된 이메일과 비밀번호를 UserDefaults에서 불러와서 저장할 변수
    var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    var password: String {
        get {
            return UserDefaults.standard.string(forKey: passwordKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: passwordKey)
        }
    }
    
    // 로그인 성공 여부를 반환하는 메서드
    func login(email: String, password: String) -> Bool {
        // 간단한 예시: 이메일과 비밀번호가 일치하면 로그인 성공으로 간주
        if self.email == email && self.password == password {
            return true
        } else {
            return false
        }
    }
    
    // UserDefaults에 이메일과 비밀번호 저장 메서드
    func saveCredentials(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // UserDefaults에서 이메일과 비밀번호 삭제 메서드
    func clearCredentials() {
        UserDefaults.standard.removeObject(forKey: emailKey)
        UserDefaults.standard.removeObject(forKey: passwordKey)
    }
}


// 이메일과 비밀번호를 처리하는 모델
struct LoginModel {
    var email: String = ""
    var password: String = ""
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
   
    func isValidPassword() -> Bool {
        return password.count >= 6
    }
    
    
    func isLoginValid() -> Bool {
        return isValidEmail() && isValidPassword()
    }
}
 soonny/main
