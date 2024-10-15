//
//  HomeModel.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/15/24.
//
import UIKit

struct HomeModel {
    let title: String
    let imageName: String
    
    var image: UIImage? {
            return UIImage(named: imageName)
        }
    
    // 더미 데이터
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(title: "크림 드로우", imageName: "image1"),
            HomeModel(title: "실시간 차트", imageName: "image2"),
            HomeModel(title: "남성 추천", imageName: "image3"),
            HomeModel(title: "여성 추천", imageName: "image4"),
            HomeModel(title: "색다른 추천", imageName: "image5"),
            HomeModel(title: "정가 아래", imageName: "image6"),
            HomeModel(title: "윤세 24AW", imageName: "image7"),
            HomeModel(title: "올해의 베스트", imageName: "image8"),
            HomeModel(title: "10월 베네핏", imageName: "image9"),
            HomeModel(title: "아크네 선물", imageName: "image10")
        ]
        
    }
}

