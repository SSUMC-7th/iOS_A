//
//  JustDroppedModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

struct JustDroppedModel {
    
    let image: String
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
                image: "https://s3-alpha-sig.figma.com/img/3888/3485/40338332862dec62a2a1370c053f1e3d?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=keSrlZ4MTCiheZbY~A8jVjzZKKmH43n1mGW7aSZ54l0Y1qEKFSo-a5bv~NKMUZ9x3u9yaOLhQnuldMN-KnKZC5PM0v8hOcptra07z40Zkq8CjOt-5ju9aNoG2IjFShuZFSfWevo2AOKCHoblBNhvK6Zp5LPn34EykTbehIhm342Y4fPxceqX5QqNCAqZEr58C9Um6F0TkkbFu8eb33vvLF8FL7SgRpu1J6jG9~BraFjomNO6cz7NII4~T~bRWTLFGMQaB6cm46T8JdjQ0jXPP2gA3z0ntghVAnw9RfrPo-ZxY5z8w6hCYEJ9k96h3ukINrQC2ofLLrWAZVvMd7Mmiw__",
                transactionCount: "거래 12.8만",
                brandName: "MLB",
                productName: "청키라이너 뉴욕양키스",
                price: "139,000원",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image: "https://s3-alpha-sig.figma.com/img/44e5/158d/85a822e2d9940249bee1e726f0fa4df1?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ePyG2YWpTiTYEdS05WEarX~XT-1Wyc8jz7VSQBmfWkzECS~f-914ZiCVL2a7vaFt8aH52HR-7bbud2q532hMnnCgT8GSl-FQ5IW~t7zx3iLcIq3CUeBU6~q9H4hTVZCgfkPwalmg-2xgSG5ttwlRlCjPNWIPadTpj9A0wwRgELLK4JMdbv3HY5r65GSY9d4fSd2204NFvS06L06xxdCcCOT2q8qrCWbyL59TwlaBlyFcPHi2xSkRKK2CVvq5LXBx--jKwCe4g6tW~DNKKZhGaWi4TSMDkgNUxGK7H~nUltZvrKKArhMTW1MIKmmINpdXD~QaobJckmQ-uwx7LnkJZQ__",
                transactionCount: "거래 15.6만",
                brandName: "Jordan",
                productName: "Jordan 1 Retro High OG\n Yellow Ochre",
                price: "228,000원",
                isBookmarked: true
            ),
            
            JustDroppedModel(
                image: "https://s3-alpha-sig.figma.com/img/6405/60ad/f845a3a967992652b95e739c468ce356?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Wje1MmGH4yCjvFOZHFjT097qG-cVibjD4rrzwX6Vjb0SH4h81NG0oG2o8SXJV2vbpLO6khh4EiVoP4V6pCaUN9re4l-gLg2DwsMg4Vp03mamC~3pCbEaXBdo1elZ50IDBgpQRg5YbgEKHHiIP8CshdcN2onp61-HK~OxWCqF50CWKym2yTmxx8xMOptLcDkiIEmVAPpVcFsA8opE7VPxmov~9syh5Hu2gId1lGNb91YCXDMMUG38cGa9W3njPqrPat1ETXi7WRFedtmcvELcwmwSLZcLV0eaO81XDACvQw15v~ibEUDkb-N-VbgS1ZurEj7p2yFMpr8z6865QckAog__",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://postfiles.pstatic.net/MjAyNDAxMDNfMjg4/MDAxNzA0MjY3NzAyMzUy.nerGzvVgXdVTe7dzB54KU787g4pjntp82tpRAlIHEPQg.4FPvzi3hGt7RuL5RtORnqg27pgpFe2a7LZ7FOEiYz8kg.JPEG.sarah001015/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C_(13).jpg?type=w3840",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/17/7c/af/177caf0e4a6a45a903020675c73cba5d.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/e7/92/90/e792901eae788841ebd53ec20cf61acd.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/f7/c3/fa/f7c3faa3ed5ba2ef83f71f4684bab2a0.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/f4/3f/3a/f43f3a82773500bfe09cae3139b26af0.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/e9/e5/8f/e9e58f523baa5854652c57385da099d6.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            ),
            JustDroppedModel(
                image: "https://i.pinimg.com/736x/2b/f8/b7/2bf8b744c30a36a1fa248194bf37bb6b.jpg",
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                isBookmarked: false
            )
        ]
    }
}
