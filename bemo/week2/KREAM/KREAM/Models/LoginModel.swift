//
//  LoginModel.swift
//  KREAM
//
//  Created by 임효진 on 9/28/24.
//

import UIKit

struct LoginModel {
    var email: String?
    var password: String?
    
    mutating func setEamil(by email: String) {
        self.email = email
    }
    
    mutating func setPassword(by password: String) {
        self.password = password
    }
}
