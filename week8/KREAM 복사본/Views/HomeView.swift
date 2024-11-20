import UIKit
import Then
import SnapKit

class Homeview: UIView {

    // ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    //contentView
    private let contentView = UIView()

    let searchBar = UISearchBar().then {
        $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
        $0.searchBarStyle = .minimal
        $0.clipsToBounds = true

        if let textField = $0.value(forKey: "searchField") as? UITextField {
            textField.textColor = UIColor.lightGray // 텍스트 색상 설정
            textField.backgroundColor = UIColor.systemGray5 // 텍스트 필드 배경색 설정
        }
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
        $0.minimumInteritemSpacing = 9 //?
        $0.minimumLineSpacing = 20
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
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
        $0.estimatedItemSize = CGSize(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }

    private let divideLine1 = UIView().then {
        $0.backgroundColor = .black
    }
    
    private let divideLine2 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    private let divideLine3 = UIView().then {
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    private let advertisement = UIImageView().then {
        $0.image = UIImage(named: "ad")
        $0.contentMode = .scaleAspectFit
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
        // ScrollView와 ContentView를 추가하여 스크롤 가능하도록 설정
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()  // 스크롤 방향을 세로로 고정
        }

        // ContentView에 기존 UI 요소를 모두 추가
        [
            searchBar,
            AlarmImageView,
            segmentedControl,
            divideLine1,
            advertisement,
            HomeCollectionView,
            divideLine2,
            JustDroppedLabel,
            releaseLabel,
            JustDroppedCollectionView,
            divideLine3,
            emptyLabel
        ].forEach {
            contentView.addSubview($0)
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
        
        divideLine1.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        advertisement.snp.makeConstraints {
            $0.top.equalTo(divideLine1.snp.bottom).offset(0)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(advertisement.snp.width).multipliedBy(336.0 / 374.0)
        }
        
        HomeCollectionView.snp.makeConstraints {
            $0.top.equalTo(advertisement.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(182)
        }
        
        divideLine2.snp.makeConstraints {
            $0.top.equalTo(HomeCollectionView.snp.bottom).offset(0)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        JustDroppedLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(19)
        }
        
        releaseLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine2.snp.bottom).offset(43)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        JustDroppedCollectionView.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(237) 
        }
        
        divideLine3.snp.makeConstraints {
            $0.top.equalTo(JustDroppedCollectionView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().offset(-20) // 스크롤 가능하도록 마지막 요소의 하단을 contentView에 맞춤

        }
        
        emptyLabel.snp.makeConstraints {
            $0.top.equalTo(divideLine3.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
                    }
    }
}
