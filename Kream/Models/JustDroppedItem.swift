import UIKit

struct JustDroppedItem {
    let imageName: String
    let title: String
    let description: String
    let price: String
    let purchaseInfo: String

    var image: UIImage? {
        return UIImage(named: imageName)
    }
}

