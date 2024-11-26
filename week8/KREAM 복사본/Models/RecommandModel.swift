//
//  RecommandModel.swift
//  KREAM
//
//  Created by 한태빈 on 11/17/24.
//

import UIKit

struct RecommandModel{
    let title: String
}

extension RecommandModel{
    static func Makedummy() ->[RecommandModel]{
        return[
            RecommandModel(title: "채원 슈프림 후리스"),
            RecommandModel(title: "나이키V2K런"),
            RecommandModel(title: "뉴발란스996"),
            RecommandModel(title: "신상 나이키 콜라보"),
            RecommandModel(title: "허그 FW 패딩"),
            RecommandModel(title: "벨루어 눕시")
        ]
    }
}
