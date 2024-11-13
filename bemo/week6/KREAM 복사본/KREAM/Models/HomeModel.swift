//
//  HomeModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

struct HomeModel{
    let image: UIImage
    let name: String
}

extension HomeModel{
    static func dummy() ->[HomeModel]{
        return[
            HomeModel(image: .category1, name: "크림 드로우"),
            HomeModel(image: .category2, name: "실시간 차트"),
            HomeModel(image: .category3, name: "남성 추천"),
            HomeModel(image: .category4, name: "여성 추천"),
            HomeModel(image: .category5, name: "색다른 추천"),
            HomeModel(image: .category6, name: "정가 아래"),
            HomeModel(image: .category7, name: "윤세 24AW"),
            HomeModel(image: .category8, name: "올해의 베스트"),
            HomeModel(image: .category9, name: "10월의 베네핏"),
            HomeModel(image: .category10, name: "아크네 선물")
        ]
    }
}
