//
//  PurchaseButton.swift
//  UMC_KREAM
//
//  Created by 소민준 on 11/19/24.
//

import UIKit

class PurchaseButton: UIView, PurchaseButtonProtocol {

    let btnType: PurchaseButtonType
    init(frame: CGRect, btnType: PurchaseButtonType) {
            self.btnType = btnType
            super.init(frame: frame)
            
            setConfigure(type: btnType)
            setBackgroundColor(type: btnType)
            addStackView()
            addComponents()
            constraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        // MARK: - Property
        
        /// 커스텀 버튼에서 사용할 가격 표시 라벨
        var priceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            label.textColor = UIColor.white
            return label
        }()
        
        /// 커스텀 버튼에서 사용할 가격 밑에 보이는 텍스트, "즉시 판매가", "즉시 구매가"
        var subLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            return label
        }()
        
        /// 버튼의 왼쪽에 구매 타입의 버튼인지, 판매 타입의 버튼인지 텍스트를 보일 라벨
        var buttonLeftLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            label.textColor = .white
            return label
        }()
        
        /// priceLabel + subLabel을 담을 스택
        var priceInfoStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 2
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            return stack
        }()
        
        // MARK: - Function
        
        /// 컴포넌트 스택에 추가
        private func addStackView() {
            [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
        }
        
        /// 버튼 내부에 추가할 컴포넌트
        private func addComponents() {
            [buttonLeftLabel, priceInfoStack].forEach{ self.addSubview($0) }
        }
        
        /// 제약 조건 설정
        private func constraints() {
            buttonLeftLabel.snp.makeConstraints {
                $0.top.equalToSuperview().offset(15)
                $0.bottom.equalToSuperview().offset(-15)
                $0.left.equalToSuperview().offset(10)
                $0.width.equalTo(28)
            }
            
            priceInfoStack.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.left.equalTo(buttonLeftLabel.snp.right).offset(21)
                $0.width.greaterThanOrEqualTo(53)
                $0.height.equalTo(30)
            }
            
            priceLabel.snp.makeConstraints {
                $0.width.greaterThanOrEqualTo(30)
                $0.height.equalTo(16)
            }
            
            subLabel.snp.makeConstraints {
                $0.width.greaterThanOrEqualTo(30)
                $0.height.equalTo(12)
            }
        }
        
        // MARK: - SetupButton Custom
        
        /// 버튼 타입을 통해 버튼 내부 텍스트 커스텀 및 버튼 자체 커스텀
        /// - Parameter type: 구매 버튼 or 판매 버튼
        private func setConfigure(type: PurchaseButtonType) {
            
            self.clipsToBounds = true
            self.layer.cornerRadius = 10
            
            buttonLeftLabel.text = buttonLeftText(type: type)
            subLabel.textColor = setTextColor(type: type)
        }
        
        
        /// 버튼 타입에 따른 서브라벨 텍스트 컬러 반환
        /// - Parameter type: 구매 버튼 or 판매 버튼
        /// - Returns: 버튼 타입에 맞는 컬러 반환
        private func setTextColor(type: PurchaseButtonType) -> UIColor {
            switch type {
            case .purchase:
                return UIColor(red: 0.639, green: 0.216, blue: 0.137, alpha: 1)
            case .sales:
                return UIColor(red: 0.122, green: 0.467, blue: 0.271, alpha: 1)
            }
        }
        
        /// 버튼 타입에 따른 버튼 배경색 반환
        /// - Parameter type: 구매 버튼 or 판매 버튼
        private func setBackgroundColor(type: PurchaseButtonType) {
            switch type {
            case .purchase:
                self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
            case .sales:
                self.backgroundColor = UIColor(red: 0.255, green: 0.725, blue: 0.478, alpha: 1)
            }
        }
        
        /// 버튼 타입에 따른 왼쪽 타입을 나타내는 텍스트 반환
        /// - Parameter type: 구매 버튼 or 판매 버튼
        /// - Returns: 타입을 스트링으로 반환
        private func buttonLeftText(type: PurchaseButtonType) -> String {
            switch type {
            case .purchase:
                return "구매"
            case .sales:
                return "판매"
            }
        }
}
