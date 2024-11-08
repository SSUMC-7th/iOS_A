import UIKit
import SnapKit
import Then

class MainHomeView: UIView {
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let contentView = UIView()
    
    let searchBar = UILabel().then {
        $0.text = "브랜드, 상품, 프로필, 태그 등"
        $0.font = UIFont(name: "Pretendard", size: 13.5)
        $0.textColor = .lightGray
        $0.backgroundColor = UIColor.systemGray5
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    private let alarmImageView = UIImageView().then {
        $0.image = UIImage(named: "alarm")
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
    
    let homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 61, height: 61) // 정확한 크기 지정
        layout.minimumInteritemSpacing = 9 // 가로 간격
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let advertisement = UIImageView().then {
        $0.image = UIImage(named: "ad")
        $0.contentMode = .scaleAspectFit
    }
    
    let emptyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.textColor = .black
        $0.text = "Working On it,,,"
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
        // ScrollView와 ContentView 추가
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 기존 UI 요소들을 contentView에 추가
        [
            searchBar,
            alarmImageView,
            segmentedControl,
            homeCollectionView,
            divideLine,
            advertisement,
            emptyLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
       
        // ScrollView와 ContentView 제약
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview() // 가로 스크롤 방지
        }
        
        // 콘텐츠 뷰 내의 각 요소 제약 설정
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(51)
            $0.height.equalTo(40)
            $0.width.equalTo(303)
            $0.leading.equalToSuperview().offset(16)
        }
        
        alarmImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(59)
            $0.leading.equalTo(searchBar.snp.trailing).offset(15)
            $0.height.equalTo(19.5)
            $0.width.equalTo(18)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(325)
            $0.height.equalTo(27)
        }
        
        divideLine.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        advertisement.snp.makeConstraints {
            $0.top.equalTo(divideLine.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(advertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(182)  // 피그마 레이아웃에 맞는 높이
        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(homeCollectionView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20) // 스크롤이 끝나도록 설정
        }
    }
    
}

