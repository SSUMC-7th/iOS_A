//
//  ChallengeModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

struct ChallengeModel {
    
    let image: UIImage
}

extension ChallengeModel {
    
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image:.challenge1),
            ChallengeModel(image:.challenge2),
            ChallengeModel(image:.challenge2),
            ChallengeModel(image:.challenge1),
        ]
    }
}
