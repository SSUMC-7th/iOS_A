import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    // 스크롤 뷰 추가
    let scrollView = UIScrollView()
    let contentView = UIView() // 스크롤 뷰 안에 들어갈 콘텐츠 뷰
    
    let searchBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        let label = UILabel()
        label.text = "브랜드, 상품, 프로필, 태그 등"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        return view
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
        imageView.contentMode = .scaleAspectFill // 이미지가 꽉 차도록 설정
        imageView.clipsToBounds = true // 이미지가 영역을 넘어가지 않도록 설정
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
    
    // 뭐 챌린지 ..
    let underlineView = UIHelpers.createSeparatorLine(color: .black, height: 2)
    let mainLabel = UIHelpers.createLabel(text: "본격 한파 대비! 연말 필수템 모음", font: .boldSystemFont(ofSize: 16), textColor: .black)
    let hashtagLabel = UIHelpers.createLabel(text: "#해피홀리록챌린지", font: .systemFont(ofSize: 14), textColor: .gray)
    let challengeItems: [String] = ["challengeImage1", "challengeImage2", "challengeImage3" ]
    
    // Just Dropped 데이터 배열
    let justDroppedItems: [JustDroppedItem] = [
        JustDroppedItem(
            imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/v6vr4e25eoq1ncjxqcjq/NIKE+P-6000.png",
            title: "Nike",
            description: "Black shoes",
            price: "139,000원",
            purchaseInfo: "즉시 구매가"
        ),
        JustDroppedItem(
            imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/mcdrf7uxgwnem8l0sv0q/NIKE+P-6000.png",
            title: "Nike",
            description: "sliver shoes",
            price: "228,000원",
            purchaseInfo: "즉시 구매가"
        ),
        JustDroppedItem(
            imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5a96e95f-90a8-4215-9692-c93eb3fe0e37/WMNS+AIR+FORCE+1+%2707.png",
            title: "Nike",
            description: "brown shoes",
            price: "2,000,000원",
            purchaseInfo: "즉시 구매가"
        ),
        JustDroppedItem(
            imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/32b0f17a-38ba-40fa-9de7-31c5bb1661e3/AIR+JORDAN+1+LOW.png",
            title: "Nike",
            description: "red and black shoes",
            price: "2,000,000원",
            purchaseInfo: "즉시 구매가"
        ),
        JustDroppedItem(
            imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b4d8abd2-187c-438d-bf06-522813827ebc/NIKE+DYNAMO+2+EASYON+LIL+%28PS%29.png",
            title: "Nike",
            description: "baby shoes",
            price: "2,000,000원",
            purchaseInfo: "즉시 구매가"
        )
       
    ]


    // 컬렉션 뷰 초기화
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false // 스크롤 비활성화
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
    //밑에 구분선 하나 더 추가
    let newSeparatorLine = UIHelpers.createSeparatorLine()
    
    //챌린지어쩌고
    let challengeCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
            searchBar.addGestureRecognizer(tapGesture)
        view.addSubview(bellButton)
        view.addSubview(segmentedControl)
        view.addSubview(underlineView)
        view.addSubview(challengeCollectionView)
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
        contentView.addSubview(newSeparatorLine)
        contentView.addSubview(mainLabel)
        contentView.addSubview(hashtagLabel)
        contentView.addSubview(challengeCollectionView)

        
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
            make.height.equalTo(36)
        }
        
        bellButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(2)
            make.height.equalTo(2)
            make.width.equalTo(UIScreen.main.bounds.width / CGFloat(segmentedControl.numberOfSegments))
            make.leading.equalTo(segmentedControl.snp.leading)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.equalTo(challengeCollectionView.snp.bottom).offset(16)
        }
        
        // 배너 이미지가 양옆으로 꽉 차게 설정
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(374) // 배너 높이
        }
        
        // 메뉴 아이템 컬렉션 뷰 레이아웃
        let totalWidth = UIScreen.main.bounds.width - 32 // 좌우 여백 16씩 제거
        let spacing: CGFloat = 8 // 셀 간 간격
        let cellWidth = (totalWidth - spacing * 4) / 5
        
        collectionView.snp.makeConstraints { make in
               make.top.equalTo(bannerImageView.snp.bottom).offset(16)
               make.leading.trailing.equalToSuperview()
               make.height.equalTo((cellWidth + 20) * 2 + 16) // 두 줄의 높이 계산
           }

        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        justDroppedTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        justDroppedSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(justDroppedTitleLabel)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(justDroppedSubtitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(220) // Just Dropped 높이
        }
        
        newSeparatorLine.snp.makeConstraints { make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(newSeparatorLine.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        hashtagLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(8)
            make.leading.equalTo(mainLabel)
        }
        
        challengeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(hashtagLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120) // 챌린지 컬렉션 뷰 높이
            make.bottom.equalToSuperview().offset(-16)
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
    func setupJustDroppedCollectionView() {
            justDroppedCollectionView.delegate = self
            justDroppedCollectionView.dataSource = self
            justDroppedCollectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: "JustDroppedCell")
        }
    func setupChallengeCollectionView() {
        challengeCollectionView.delegate = self
        challengeCollectionView.dataSource = self
        challengeCollectionView.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
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
    
    // MARK: - SearchBar 클릭 시 호출
    @objc func searchBarTapped() {
        let searchBarTab = SearchBarTabViewController()
        navigationController?.pushViewController(searchBarTab, animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return menuItems.count
        } else if collectionView == self.justDroppedCollectionView {
            return justDroppedItems.count
        } else if collectionView == self.challengeCollectionView {
            return challengeItems.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MainMenuCollectionViewCell
            let menuItem = menuItems[indexPath.item]
            cell.configure(imageName: menuItem.image, title: menuItem.title)
            return cell
        } else if collectionView == self.justDroppedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JustDroppedCell", for: indexPath) as! JustDroppedCollectionViewCell
            let justDroppedItem = justDroppedItems[indexPath.item]
            cell.configure(with: justDroppedItem)
            return cell
        } else if collectionView == self.challengeCollectionView {
            // 여기에서 셀을 설정합니다.
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as! ChallengeCollectionViewCell
            let imageName = challengeItems[indexPath.item]
            let title = "챌린지 \(indexPath.item + 1)" // 적절한 제목 설정
            cell.configure(imageName: imageName, title: title) // 이미지와 제목 전달
            return cell
        }
        return UICollectionViewCell()
    }

    // 셀 크기 설정 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            // 한 줄에 5개씩 표시
            let totalWidth = UIScreen.main.bounds.width - 32 // 좌우 여백 16씩 제거
            let spacing: CGFloat = 8 // 셀 간 간격
            let cellWidth = (totalWidth - spacing * 4) / 5 // 셀 5개, 간격 4개
            return CGSize(width: cellWidth, height: cellWidth + 20) // 높이는 셀 너비에 추가 공간을 더함
        } else if collectionView == self.justDroppedCollectionView {
            return CGSize(width: 150, height: 230) // Just Dropped 컬렉션 뷰
        } else if collectionView == self.challengeCollectionView {
            // 챌린지 셀 크기 설정
            let cellWidth: CGFloat = 124
            let imageHeight: CGFloat = 165
            let titleHeight: CGFloat = 16
            let spacing: CGFloat = 8
            let cellHeight = imageHeight + titleHeight + spacing // 이미지 높이 + 텍스트 높이 + 간격
            return CGSize(width: cellWidth, height: cellHeight)
        }
        return CGSize(width: 61, height: 81)
    }

}
