import UIKit

struct JustDroppedModel {
    let image: UIImage          //상품 이미지
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
                image: UIImage(named: "JustDropped1") ?? UIImage(),
                transactionCount: "거래 12.8만",
                brandName: "MLB",
                productName: "청키라이너 뉴욕양키스",
                price: "139,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            ),

            JustDroppedModel(
                image: UIImage(named: "JustDropped2") ?? UIImage(),
                transactionCount: "거래 15.6만",
                brandName: "Jordan",
                productName: "Jordan 1 Retro High OG\n Yellow Ochre",
                price: "228,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: true
            ),

            JustDroppedModel(
                image: UIImage(named: "JustDropped3") ?? UIImage(),
                transactionCount: "거래 12.8만",
                brandName: "Human Made",
                productName: "Human Made x Kaws\nVarsity Jacket #1 Black",
                price: "2,000,000원",
                buyNowLabel: "즉시 구매가",
                isBookmarked: false
            )
        ]
    }
}

