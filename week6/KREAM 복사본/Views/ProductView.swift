//
//  ProductView.swift
//  KREAM
//
//  Created by 한태빈 on 11/8/24.
//

import UIKit

class ProductView: UIView {
    
    private let mainproductImageView = UIImageView().then {
        $0.image = UIImage(named: "matinkimblack")
        $0.contentMode = .scaleAspectFit
    }
    
    private let buynowprice = UILabel().then{
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    private let productprice = UILabel().then{
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
    }
    
    private let productname = UILabel().then{
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private let productkname = UILabel().then{
        $0.text = "마땡킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
        
    }
    ActionButton
}
