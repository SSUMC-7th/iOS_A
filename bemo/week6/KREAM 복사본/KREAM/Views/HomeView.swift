//
//  HomeView.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchBar = UITextField().then {
        $0.text = "  브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont.systemFont(ofSize: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor =  UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        $0.layer.cornerRadius = 12
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 30))
        $0.leftViewMode = .always
        
    }
    
    private let AlarmImageView = UIButton().then {
        $0.setImage(UIImage(named: "alarm"), for: .normal)
        $0.contentMode = .scaleAspectFit
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
                .font: UIFont.systemFont(ofSize: 16, weight: .light),
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold),
            ],
            for: .selected
        )
    }
    
    let underline = UIView().then {
        $0.backgroundColor = .black
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
    
    let advertisement = UIImageView().then {
        $0.image = UIImage(named: "advertisement")
        $0.contentMode = .scaleAspectFit
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "휑"
        $0.isHidden = true
    }
    
    // ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    //contentView
    private let contentView = UIView()
    
    private let JustDroppedLabel = UILabel().then {
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    
    private let releaseLabel = UILabel().then {
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    }
    
    let JustDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }
    
    private let divideLine1 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    private let divideLine2 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    private let label2 = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .black
    }
    
    private let subLabel2 = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    }
    
    let ChallengeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
    }
    
    private func setupView(){
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(750)
        }
        
        
        [
            searchBar,
            AlarmImageView,
            segmentedControl,
            underline,
            emptyLabel,
            HomeCollectionView,
            advertisement,
            JustDroppedLabel,
            releaseLabel,
            JustDroppedCollectionView,
            divideLine1,
            divideLine2,
            label2,
            subLabel2,
            ChallengeCollectionView
            
        ].forEach {
            contentView.addSubview($0)
        }
        
        searchBar.snp.makeConstraints{
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(16)
        }
        
        AlarmImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(17)
            $0.right.equalToSuperview().offset(-16)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        underline.snp.makeConstraints {
            $0.height.equalTo(2) // 높이 2
            $0.width.equalTo(segmentedControl.snp.width).dividedBy(segmentedControl.numberOfSegments) // 세그먼트 길이만큼 나누기
            $0.top.equalTo(segmentedControl.snp.bottom).offset(4) // 세그먼트 아래로 4포인트 떨어짐
            $0.left.equalTo(segmentedControl.snp.left) // 초기 위치 설정
        }
        
        advertisement.snp.makeConstraints {
            $0.top.equalTo(underline.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(advertisement.snp.width).multipliedBy(336.0 / 374.0) // 비율을 유지한 채 크기 설정
        }
        
        HomeCollectionView.snp.makeConstraints{
            $0.top.equalTo(advertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16) // 가로 전체로 확장
            $0.height.equalTo(182)
        }
        
        divideLine1.snp.makeConstraints{
            $0.top.equalTo(HomeCollectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        JustDroppedLabel.snp.makeConstraints{
            $0.top.equalTo(divideLine1.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
        }
        
        releaseLabel.snp.makeConstraints{
            $0.top.equalTo(JustDroppedLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(16)
        }
        
        JustDroppedCollectionView.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints{
            $0.top.equalTo(JustDroppedCollectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        label2.snp.makeConstraints{
            $0.top.equalTo(divideLine2.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(16)
        }
        
        subLabel2.snp.makeConstraints{
            $0.top.equalTo(label2.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(16)
        }
        
        ChallengeCollectionView.snp.makeConstraints {
            $0.top.equalTo(subLabel2.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(165)
        }
        
        emptyLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
