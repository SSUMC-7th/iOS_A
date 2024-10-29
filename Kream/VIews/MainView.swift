import UIKit
import SnapKit

class MainView: UIView {
    
    // 스크롤 뷰 추가
    let scrollView = UIScrollView()
    let contentView = UIView() // 스크롤 뷰 안에 들어갈 콘텐츠 뷰
    
    // UI 요소들
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .systemGray6
        return searchBar
    }()
    
    let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let segmentedControl: UISegmentedControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 14)], for: .selected)
        return segmentedControl
    }()
    
    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "banner_image")
        return imageView
    }()
    
    // 메뉴 컬렉션 뷰 추가
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets.zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // Just Dropped 컬렉션 뷰 추가
    let justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 레이아웃 설정
    func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // UI 요소들을 contentView에 추가
        contentView.addSubview(searchBar)
        contentView.addSubview(bellButton)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(underlineView)
        contentView.addSubview(bannerImageView)
        contentView.addSubview(collectionView)
        contentView.addSubview(justDroppedCollectionView)
        
        // 스크롤 뷰 제약 설정
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 콘텐츠 뷰 제약 설정 (스크롤 가능하도록 높이를 자동으로 설정)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide) // 스크롤 방향을 세로로 제한
        }
        
        // 기존 레이아웃 설정
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(bellButton.snp.leading).offset(-8)
            make.height.equalTo(44)
        }
        
        bellButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(2)
            make.height.equalTo(2)
            make.width.equalTo(50)
            make.leading.equalTo(segmentedControl.snp.leading)
        }
        
        // 배너 이미지 레이아웃 설정 - 지정된 크기로 설정
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(374) // 지정된 너비
            make.height.equalTo(336) // 지정된 높이
        }
        
        // 메뉴 컬렉션 뷰 레이아웃 설정
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(220)
        }
        
        // Just Dropped 컬렉션 뷰 레이아웃 설정
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        // 마지막 UI 요소인 justDroppedCollectionView의 하단을 contentView 하단에 맞춤
        justDroppedCollectionView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-16) // contentView의 끝에 맞춰 스크롤 가능하도록 설정
        }
    }
}

