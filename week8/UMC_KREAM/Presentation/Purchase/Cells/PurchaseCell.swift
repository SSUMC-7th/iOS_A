//
//  PurchaseCell.swift
//  UMC_KREAM
//
//  Created by 소민준 on 11/20/24.
//

import UIKit
import SnapKit

class PurchaseCell: UICollectionViewCell {
    
    
    static let identifier: String = "PurchaseCollectionViewCell"
        
        //MARK: - Init
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            constraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            self.imageView.image = nil
        }
        
        // MARK: - Property
        
        /// 셀 내부 이미지 버튼
        private lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            return imageView
        }()
        
        // MARK: - Function
        
        /// 제약 조건 설정
        private func constraints() {
            self.addSubview(imageView)
            
            imageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        
        /// 뷰 컨트롤러에서 셀 접근하여 데이터 할당
        /// - Parameter model: RequiredCellProtocol을 상속 받는 모델 데이터 입력!
        public func configure(model: any RequiredCellProtocol) {
            /* as를 통해 RequiredCellProtocol을 상속 받는 모델이면서, 해당 셀에서 사용할 실제 모델 할당 */
            guard let purchaseData = model as? PurchaseModel else { return }
            self.imageView.image = UIImage(named: purchaseData.imageView)
        }
        
    }

    
