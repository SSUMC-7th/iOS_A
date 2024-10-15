//
//  MainHomeView.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/15/24.
//

import UIKit
import Then

// UIView에서 ViewController를 가져오는 확장
extension UIView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

class MainHomeView: UIView {
    
    let searchBar = UILabel().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont(name: "Pretendard", size: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor = UIColor.systemGray5
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true 
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
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
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
        $0.minimumInteritemSpacing = 9 //가로 간격
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
        $0.text = "Working On it,,,"
        $0.isHidden = true
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        [
            searchBar,
            AlarmImageView,
            segmentedControl,
            HomeCollectionView,
            divideLine,
            advertisement,
            emptyLabel
        ].forEach{
            addSubview($0)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
        searchBar.isUserInteractionEnabled = true
        searchBar.addGestureRecognizer(tapGesture)

        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.width.equalTo(303)
            $0.leading.equalToSuperview().offset(16)
        }
        
        AlarmImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(15)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(325)
            $0.height.equalTo(27)
        }

        divideLine.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        advertisement.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(0)
            $0.horizontalEdges.equalToSuperview()
        }
        
        HomeCollectionView.snp.makeConstraints{
            $0.top.equalTo(advertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(182)  // 피그마 레이아웃에 맞는 높이
        

        }
        
        emptyLabel.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom).offset(546)
            $0.centerX.equalToSuperview()
        }
    }

    // 검색창 탭 이벤트 처리
    @objc
    private func searchBarTapped() {
        let searchViewController = SearchViewController()
        if let parentViewController = self.parentViewController() {
            parentViewController.navigationController?.pushViewController(searchViewController, animated: true)
        }
    }
}
