import UIKit

struct JustDroppedModel {
    let image: URL?          //상품 이미지
    let transactionCount: String //(예: "거래 12.8만")
    let brandName: String        //(예: "MLB")
    let productName: String      //(예: "청키라이너 뉴욕양키스")
    let price: String            //(예: "139,000원")
    let buyNowLabel: String      //(예: "즉시 구매가")
    var isBookmarked: Bool       // 저장 여부 (북마크 상태)
}

extension JustDroppedModel {
    // 더미 데이터 생성 메서드
    static func MakeDummy2() -> [JustDroppedModel] {
        return [
            JustDroppedModel(
                image:URL(string: "https://static-resource.mlb-korea.com/cdn-cgi/image/q=75,w=1236,format=auto,fit=scale-down,onerror=redirect/images/goods/ec/M23N3ASXCLB3N50GNS/8967697817924F98B889F855240537CB.jpg"),
                transactionCount: "거래 12.8만",
                brandName: "MLB",
                productName: "청키라이너 뉴욕양키스",
                price: "139,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcP5-7wBPa8h18VAExt3dEo4SMAGAy0NBqAw&s"),
                transactionCount: "거래 15.6만",
                brandName: "Jordan",
                productName: "Jordan 1 Retro High OG\n Yellow Ochre",
                price: "228,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: true
            ),
            
            JustDroppedModel(
                image:URL(string: "https://product-image.wconcept.co.kr/productimg/image/img0/00/301492000_DW33175.jpg"),
                transactionCount: "거래 12.8만",
                brandName: "Matin Kim",
                productName: "Matin Kim Logo Coating \nJumper",
                price: "228,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://sansangear.com/web/product/big/202406/019784de6b64b4f9e4b8944c1d1e4a48.jpg"),
                transactionCount: "거래 362",
                brandName: "Sansan Gear",
                productName: "BACKPACK JACKET \nLIGHT GREY",
                price: "298,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://media.bunjang.co.kr/product/254822489_2_1709019522_w360.jpg"),
                transactionCount: "거래 13.5만",
                brandName: "New Balance",
                productName: "New Balance 442 grey",
                price: "367,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://images.stockx.com/images/Air-Jordan-Cut-The-Check-TR-Travis-Scott-Mocha-Product.jpg?fit=fill&bg=FFFFFF&w=1200&h=857&q=60&dpr=1&trim=color&updated_at=1731332871"),
                transactionCount: "거래 764",
                brandName: "Jordan",
                productName: "Jordan Jumpman Jack TR\n Travis Scott Dark\n Mocha Men's",
                price: "207,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXdixV__b4buhG0UR6ZLgGBgOs3Pj6O5dmvA&s"),
                transactionCount: "거래 1.4만",
                brandName: "Maru is a Puppy",
                productName: "Maru is a Puppy \nJelly Case Toy Maru",
                price: "27,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://d2gfz7wkiigkmv.cloudfront.net/pickin/2/1/2/OsHU06zDQOa_EpJqyhnMQA"),
                transactionCount: "거래 3.5만",
                brandName: "Belier",
                productName: "Cross Line Hooded \nGoose Down",
                price: "427,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),
            
            JustDroppedModel(
                image:URL(string: "https://img.croket.co.kr/item/thumbnail/c4bbefd775aafb1a50ade6e7dd434b1a.webp"),
                transactionCount: "거래 3.6만",
                brandName: "Adidas",
                productName: "y-3 gazelle black",
                price: "326,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),

            JustDroppedModel(
                image:URL(string: "https://ecimg.cafe24img.com/pg502b28970736042/ertr134340/web/product/medium/20241002/3cff5b689e79dde4bb0e1696c1cfa784.jpg"),
                transactionCount: "거래 9.8만",
                brandName: "ERTR",
                productName: "Reversible Hoodie \nZip-Up Check Blue",
                price: "198,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),


        ]
    }
}
