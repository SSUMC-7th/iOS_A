//
//  LoginModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import Foundation

struct LoginModel {
    private let userDefaults = UserDefaults.standard
    var emailKey: String = "userEmail"
    var passwordKey: String = "userPasseord"
    var profileImageKey: String = "profileImage"
    
    mutating func setEamil(by email: String) {
        self.emailKey = email
    }
    
    mutating func setPassword(by password: String) {
        self.passwordKey = password
    }
    
    public func saveUserEmail(_ email: String) {
        userDefaults.set(email, forKey: emailKey)
    }
    
    public func saveUserPassword(_ password: String) {
        userDefaults.set(password, forKey: passwordKey)
    }
    
    public func saveUserProfileImage(_ profileImage: String) {
        userDefaults.set(profileImage, forKey: profileImageKey)
    }
    
    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: emailKey)
    }
    
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: passwordKey)
    }
    
    public func loadUserProfileImage() -> String? {
        return userDefaults.string(forKey: profileImageKey)
    }
}
