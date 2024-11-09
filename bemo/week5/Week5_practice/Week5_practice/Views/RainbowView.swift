//
//  RainbowView.swift
//  Week5_practice
//
//  Created by 임효진 on 10/23/24.
//

import UIKit
import SnapKit

class RainbowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    // 스크롤뷰 및 기본 레이아웃 설정
    private func setupView() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide) // 스크롤 뷰 안전영역 지키기
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView()
            colorView.backgroundColor = color
            scrollView.addSubview(colorView)
            
            colorView.snp.makeConstraints {
                $0.left.right.equalToSuperview() // 좌우로 스크롤 없이 화면 크기에 맞춤
                $0.width.equalTo(self.snp.width) // 피그마 디자인
                $0.height.equalTo(176) // 피그마 디자인 높이
                
                
                if let previousView = previousView {
                    $0.top.equalTo(previousView.snp.bottom) // 이전 뷰의 하단에 배치
                } else {
                    $0.top.equalToSuperview() // 첫 번째 뷰는 스크롤뷰 상단에 맞춤
                }
            }
            
            previousView = colorView
        }
        
        // 마지막 뷰의 하단을 스크롤뷰의 하단에 맞춤으로써 스크롤 가능하게 설정
        if let lastView = previousView {
            lastView.snp.makeConstraints {
                $0.bottom.equalToSuperview()
            }
        }
    }
    
}
