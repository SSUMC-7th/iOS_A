//
//  File.swift
//  KREAM
//
//  Created by 임효진 on 11/8/24.
//

import UIKit

struct ColorModel {
    
    let image: UIImage
}

extension ColorModel {
    
    static func dummy() -> [ColorModel] {
        return [
            ColorModel(image:.detailImage1),
            ColorModel(image:.detailImage2),
            ColorModel(image:.detailImage3),
            ColorModel(image:.detailImage4),
            ColorModel(image:.detailImage5),
            ColorModel(image:.detailImage6),
            ColorModel(image:.detailImage1),
            ColorModel(image:.detailImage2),
            ColorModel(image:.detailImage3),
        ]
    }
}
