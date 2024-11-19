//
//  JustDroppedModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

struct JustDroppedModel {
    
    let image: UIImage
    let transactionCount: String
    let brandName: String
    let productName: String
    let price: String
    var isBookmarked: Bool
}

extension JustDroppedModel {
    // 더미 데이터 생성 메서드
    static func dummy() -> [JustDroppedModel] {
        return [
            JustDroppedModel(
                image:.justDropped1,
                transactionCount: "거래 12.8만",
                brandName: "MLB",
                productName: "청키라이너 뉴욕양키스",
                price: "139,000원",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:.justDropped2,
                transactionCount: "거래 15.6만",
                brandName: "Jordan",
                productName: "Jordan 1 Retro High OG\n Yellow Ochre",
                price: "228,000원",
                isBookmarked: true
            ),
            
            JustDroppedModel(
                image:.justDropped2,
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            )
        ]
    }
}
