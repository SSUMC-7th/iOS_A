//
//  CustomNavagationTitle.swift
//  UMC_KREAM
//
//  Created by 소민준 on 11/19/24.
//

import UIKit
import SnapKit

class CustomNavagationTitle: UIView {

    let titleText: String
    let subTitleText: String?


    init(frame: CGRect, titleText: String, subTitleText: String?) {
            self.titleText = titleText
            self.subTitleText = subTitleText
            
            super.init(frame: frame)
            
            setTitle(title: titleText, subTitle: subTitleText)
            constraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    /// 네비게이션 타이틀뷰의 메인 타이틀 라벨
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            return label
        }()
        
        /// 네비게이션 타이틀뷰의 서브 타이틀 라벨
        private lazy var subTitleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            return label
        }()
        
        /// 네비게이션 타이틀뷰의 메인 타이틀 + 서브 타이틀 스택
        private lazy var titleStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
            stack.axis = .vertical
            stack.spacing = 2
            stack.alignment = .center
            return stack
        }()
        
        // MARK: - Function
        
        /// 초기화를 통해 전달 받은 메인 타이틀 값, 서브 타이틀 값을 전달하여 해당 라벨에 적용
        /// - Parameters:
        ///   - title: 초기화를 통해 설정된 메인 타이틀 값
        ///   - subTitle: 초기화를 통해 설정된 서브 타이틀 값
        private func setTitle(title: String, subTitle: String?) {
            self.titleLabel.text = title
            self.subTitleLabel.text = subTitle ?? nil
        }
        
        /// 제약 조건 설정
        private func constraints() {
            self.addSubview(titleStack)
            titleStack.snp.makeConstraints {
                $0.centerY.centerX.equalToSuperview()
            }
        }
        

    }

