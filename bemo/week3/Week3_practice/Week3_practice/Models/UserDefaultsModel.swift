//
//  UserDefaultsModel.swift
//  Week3_practice
//
//  Created by 임효진 on 10/12/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey: String = "userText"
    
    /// 유저가 입력한 텍스트 값을 UserDefaults에 저장합니다.
    /// - Parameter text: 유저가 입력한 텍스트 값
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    /// UserDefaults에 저장된 값을 불러옵니다.
    /// - Returns: 저장된 값 String으로 return
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
