import Foundation

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
