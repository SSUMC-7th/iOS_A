
//  Created by 한태빈 on 10/15/24.
//

import UIKit

struct HomeModel{
    let image: UIImage
    let name: String
}

extension HomeModel{
    static func dummy() ->[HomeModel]{
        return[
            HomeModel(image: .mainDraw, name: "크림 드로우"),
            HomeModel(image: .mainChart, name: "실시간 차트"),
            HomeModel(image: .mainMen, name: "남성 추천"),
            HomeModel(image: .mainWomen, name: "여성 추천"),
            HomeModel(image: .mainUnique, name: "색다른 추천"),
            HomeModel(image: .mainCheap, name: "정가 아래"),
            HomeModel(image: .mainAW, name: "윤세 24AW"),
            HomeModel(image: .mainYB, name: "올해의 베스트"),
            HomeModel(image: .mainDecember, name: "10월의 베네핏"),
            HomeModel(image: .mainAcne, name: "아크네 선물")
        ]
    }
}
