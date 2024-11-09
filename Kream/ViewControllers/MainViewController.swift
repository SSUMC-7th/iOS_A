import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    // 스크롤 뷰 추가
    let scrollView = UIScrollView()
    let contentView = UIView() // 스크롤 뷰 안에 들어갈 콘텐츠 뷰
    
    // 검색창 추가
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .systemGray6
        return searchBar
    }()
    
    // 알림 버튼 추가
    let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // 배너 이미지 추가
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "banner_image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // SegmentedControl 추가
    let segmentedControl: UISegmentedControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 14)], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    // 밑줄 뷰 추가
    let underlineView = UIHelpers.createSeparatorLine(color: .black, height: 2)
    
    // 메뉴 아이템 데이터 배열
    let menuItems = [
        (image: "collection1", title: "크림 드로우"),
        (image: "collection2", title: "실시간 차트"),
        (image: "collection3", title: "남성 추천"),
        (image: "collection4", title: "여성 추천"),
        (image: "collection5", title: "색다른 추천"),
        (image: "collection6", title: "정가 아래"),
        (image: "collection7", title: "운세 24AW"),
        (image: "collection8", title: "올해의 베스트"),
        (image: "collection9", title: "10월 베네핏"),
        (image: "collection10", title: "아크네 선물")
    ]
    
    // Just Dropped 데이터 배열
    let justDroppedItems: [JustDroppedItem] = [
        JustDroppedItem(imageName: "dropImage1", title: "MLB", description: "청키라이너 뉴욕양키스", price: "139,000원", purchaseInfo: "즉시 구매가"),
        JustDroppedItem(imageName: "dropImage2", title: "Jordan", description: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", purchaseInfo: "즉시 구매가"),
        JustDroppedItem(imageName: "dropImage3", title: "Human Made", description: "Human Made Varsity Jacket", price: "2,000,000원", purchaseInfo: "즉시 구매가")
    ]
    
    // 컬렉션 뷰 초기화
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 9
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // 구분선 및 텍스트 레이블들 추가
    let separatorLine = UIHelpers.createSeparatorLine()
    let justDroppedTitleLabel = UIHelpers.createLabel(text: "Just Dropped", font: .boldSystemFont(ofSize: 18), textColor: .black)
    let justDroppedSubtitleLabel = UIHelpers.createLabel(text: "발매 상품", font: .systemFont(ofSize: 14), textColor: .gray)
    
    // Just Dropped 섹션 초기화
    let justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 검색창과 알림 버튼, 세그먼트 추가 (스크롤 뷰 바깥에 위치)
        view.addSubview(searchBar)
        view.addSubview(bellButton)
        view.addSubview(segmentedControl)
        view.addSubview(underlineView)
        
        // 스크롤 뷰와 콘텐츠 뷰 설정
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 네비게이션 타이틀 제거
        navigationItem.title = nil
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // UI 요소들 콘텐츠 뷰에 추가
        contentView.addSubview(bannerImageView)
        contentView.addSubview(collectionView)
        contentView.addSubview(separatorLine)
        contentView.addSubview(justDroppedTitleLabel)
        contentView.addSubview(justDroppedSubtitleLabel)
        contentView.addSubview(justDroppedCollectionView)
        
        setupCollectionView()
        setupLayout()
    }
    
    // 레이아웃 설정
    func setupLayout() {
        // 검색창 레이아웃
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
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
        
        // 밑줄 초기 위치 설정
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(2)
            make.height.equalTo(2)
            make.width.equalTo(segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments))
            make.leading.equalTo(segmentedControl.snp.leading)
        }
        
        // 스크롤 뷰 레이아웃
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        // 콘텐츠 뷰 레이아웃
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        // 배너 이미지 레이아웃
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(336)
        }
        
        // 컬렉션 뷰 레이아웃 (메뉴 아이템)
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(bannerImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }

        // 구분선과 텍스트 레이아웃
        separatorLine.snp.remakeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }

        justDroppedTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
        }

        justDroppedSubtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(justDroppedTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(justDroppedTitleLabel)
        }

        // Just Dropped 컬렉션 뷰 레이아웃
        justDroppedCollectionView.snp.remakeConstraints { make in
            make.top.equalTo(justDroppedSubtitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
            make.bottom.equalToSuperview().offset(-30)
        }

    }
    
    // MARK: - UICollectionView 설정 메서드
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        
        justDroppedCollectionView.delegate = self
        justDroppedCollectionView.dataSource = self
        justDroppedCollectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: "JustDroppedCell")
    }

    // MARK: - 세그먼트 선택 변경 시 호출
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        updateUnderlinePosition()
        displaySelectedView(index: sender.selectedSegmentIndex)
    }

    // 밑줄 위치 업데이트
    func updateUnderlinePosition() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        underlineView.snp.updateConstraints { make in
            make.width.equalTo(segmentWidth)
            make.leading.equalTo(segmentedControl.snp.leading).offset(segmentWidth * CGFloat(selectedIndex))
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    // 세그먼트 선택에 따라 화면 전환
    func displaySelectedView(index: Int) {
        // 이전에 추가된 서브뷰 제거
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        switch index {
        case 0:
            contentView.addSubview(bannerImageView)
            bannerImageView.snp.makeConstraints { make in
                make.top.equalTo(contentView).offset(16)
                make.leading.trailing.equalToSuperview().inset(16)
                make.height.equalTo(336)
            }
            
            contentView.addSubview(separatorLine)
            separatorLine.snp.makeConstraints { make in
                make.top.equalTo(bannerImageView.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
            }
            
            contentView.addSubview(justDroppedTitleLabel)
            justDroppedTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(separatorLine.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(16)
            }
            
            contentView.addSubview(justDroppedSubtitleLabel)
            justDroppedSubtitleLabel.snp.makeConstraints { make in
                make.top.equalTo(justDroppedTitleLabel.snp.bottom).offset(4)
                make.leading.equalTo(justDroppedTitleLabel)
            }
            
            contentView.addSubview(collectionView)
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(justDroppedSubtitleLabel.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(200)
            }
            
            contentView.addSubview(justDroppedCollectionView)
            justDroppedCollectionView.snp.makeConstraints { make in
                make.top.equalTo(collectionView.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(200)
                make.bottom.equalToSuperview().offset(-20)
            }
        default:
            let label = UILabel()
            label.textAlignment = .center
            contentView.addSubview(label)
            label.snp.makeConstraints { make in
                make.center.equalTo(contentView)
            }
        }
    }
    }

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionView == self.collectionView ? menuItems.count : justDroppedItems.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == self.collectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MainMenuCollectionViewCell
        let menuItem = menuItems[indexPath.item]
        cell.configure(imageName: menuItem.image, title: menuItem.title)
        return cell
    } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JustDroppedCell", for: indexPath) as! JustDroppedCollectionViewCell
        let justDroppedItem = justDroppedItems[indexPath.item]
        cell.configure(with: justDroppedItem)
        return cell
    }
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.justDroppedCollectionView {
            return CGSize(width: 150, height: 230) 
        }
        return CGSize(width: 61, height: 81)
    }

}


