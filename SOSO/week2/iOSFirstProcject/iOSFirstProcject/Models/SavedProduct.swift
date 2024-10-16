//
//  SavedProduct.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/12/24.
//

import Foundation
struct SavedProduct {
    let imageName: String
    let description: Description
    let price: Int
}

struct Description {
    let title: String
    let subTitle: String
}

final class SavedProductData {
    static let datalist: [SavedProduct] = [
        SavedProduct(imageName: "1.png", description: Description(title: "Stussy", subTitle: "Stussy Basic Stussy Zip hoodie Ash Heather 2024"), price: 217000),
        SavedProduct(imageName: "2.png", description: Description(title: "Supreme", subTitle: "Supreme Box Logo Hooded Sweatshirt Black"), price: 339000),
        SavedProduct(imageName: "3.png", description: Description(title: "Supreme", subTitle: "Supreme Polartec Shearling Reversible Pullover Black"), price: 368000),
        SavedProduct(imageName: "4.png", description: Description(title: "Human Made", subTitle: "Human Made Low Gauge Knit Sweater Black"), price: 420000),
        SavedProduct(imageName: "5.png", description: Description(title: "Chanel", subTitle: "Chanel Small Flap Bag with Top Handle Grained Calfskin & Gold Black"), price: 9200000),
        SavedProduct(imageName: "6.png", description: Description(title: "Palace", subTitle: "Palace x McDonald's Logo Hood Black - 23FW"), price: 192000),
        SavedProduct(imageName: "7.png", description: Description(title: "BAPE", subTitle: "BAPE 1st Camo Shark Full Zip Hoodie Army Green "), price: 549000),
        SavedProduct(imageName: "8.png", description: Description(title: "Chrome Hearts", subTitle: "Chrome Hearts Bonennoisseur Black Brushed Silver"), price: 2430000),
        SavedProduct(imageName: "9.png", description: Description(title: "NIKE", subTitle: "Nike x Martine Rose Shox MR4 Black"), price: 567000),
        SavedProduct(imageName: "10.png", description: Description(title: "Stussy", subTitle: "Stussy 8 Ball Pigment Dyed Zip Hoodie Black"), price: 245000)
    ]
}
