import Foundation

struct ProductSearchResponse: Decodable {
    let products: [KeywordModel]
    let total: Int
    let skip: Int
    let limit: Int
}

struct KeywordModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let brand: String
    let category: String
    let thumbnail: String
}

