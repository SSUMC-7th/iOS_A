//
//  LoginModel.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 9/28/24.
//

import Foundation

struct LoginModel{
    var id: String
    var pwd: String
    
    init(id: String = "", pwd: String = "") {
            self.id = id
            self.pwd = pwd
        }
        
}
