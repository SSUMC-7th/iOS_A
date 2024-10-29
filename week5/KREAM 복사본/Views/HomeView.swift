//
//  Homeview.swift
//  Kream
//
//  Created by 한태빈 on 10/14/24.
//

import UIKit
import Then
import SnapKit

class Homeview: UIView {
    
    private let searchBar = UILabel().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont(name: "Pretendard", size: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor = UIColor.systemGray5
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true // 모서리 굴절 적용이 안돼 코드 추가
    }

    private let AlarmImageView = UIImageView().then {
        $0.image = UIImage(named: "alarm")
        $0.contentMode = .scaleAspectFit
        $0.snp.makeConstraints { make in
            make.height.equalTo(19.5)
            make.width.equalTo(18)
        }
    }
    
    let segmentedControl = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        
        // Divider 이미지 사용하지 않음
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

        // 텍스트 속성 설정
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }

    let HomeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9 // 가로 간격
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let advertisement = UIImageView().then {
        $0.image = UIImage(named: "ad")
        $0.contentMode = .scaleAspectFit
        $0.snp.makeConstraints { make in
            make.height.equalTo(336)
            make.width.equalTo(374)
        }
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "아직 개발 중.."
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            searchBar,
            AlarmImageView,
            segmentedControl,
            HomeCollectionView,
            divideLine,
            advertisement,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.width.equalTo(303)
            $0.leading.equalToSuperview().offset(16)
        }
        
        AlarmImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(15)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-25)
            $0.height.equalTo(27)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        advertisement.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(0)
            $0.horizontalEdges.equalToSuperview() // 좌우 공백을 없애고 가득 채움
            $0.height.equalTo(advertisement.snp.width).multipliedBy(336.0 / 374.0) // 비율 유지
        }
        
        HomeCollectionView.snp.makeConstraints {
            $0.top.equalTo(advertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16) // 가로 전체로 확장
            $0.bottom.equalToSuperview().inset(20) // 하단 제약 조건 추가
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom).offset(546)
            $0.centerX.equalToSuperview()
        }
    }
}
