//
//  CellHeaderProtocol.swift
//  UMC_KREAM
//
//  Created by 소민준 on 11/20/24.
//

import UIKit

/// 셀의 헤더가 컴포넌트 정의 프로토콜
protocol CellHeaderProtocol {
    var headerTitle: UILabel { get }
    var headerSubTitle: UILabel { get }
}
