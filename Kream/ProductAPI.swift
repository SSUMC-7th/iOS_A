//
//  ProductAPI.swift.swift
//  Kream
//
//  Created by 임소은 on 11/18/24.
//

import UIKit
import SnapKit
import Moya
import Foundation 

enum ProductAPI {
    case searchProducts(query: String)
}

extension ProductAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    var path: String {
        switch self {
        case .searchProducts:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchProducts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .searchProducts(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
