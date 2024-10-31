//
//  UserInfo.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/12/24.
//

import Foundation
struct UserInfo {
    let id: String
    let pwd: String
    
    /// UserDefaults에 저장하는 메서드
    public func saveUserDefaults() {
        UserDefaults.standard.set(id, forKey: "userId")
        UserDefaults.standard.set(pwd, forKey: "userPwd")
    }
    
    /// UserDefaults에서 회원 아이디, 비밀번호 불러오기
    /// - Returns: 아이디, 비밀번호 반환
    static func loadUserDefaults() -> UserInfo? {
        guard
            let id = UserDefaults.standard.string(forKey: "userId"),
            let pwd = UserDefaults.standard.string(forKey: "userPwd")
        else {
            return nil
        }
        return UserInfo(id: id, pwd: pwd)
    }
    
}
