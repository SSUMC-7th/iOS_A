import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    init(id: String = "", pwd: String = "") {
        self.id = id
        self.pwd = pwd
    }
    
    // UserDefaults로 아이디 비번 저장
    public func saveToUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
    }
    
    // 회원 아이디, 비밀번호 불러오기
    //아이디, 비밀번호 반환
    static func loadFromUserDefaults() -> LoginModel? {
        guard
            let id = UserDefaults.standard.string(forKey: "userId"),
            let pwd = UserDefaults.standard.string(forKey: "userPwd")
        else {
            return nil
        }
        return LoginModel(id: id, pwd: pwd)
    }
}
