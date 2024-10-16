import UIKit
import SnapKit

class MainViewController: UIViewController {

    // 뷰 인스턴스 생성
    let mainView = MainView()
    
    // 검색창 추가
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.backgroundImage = UIImage()  // 기본 배경 이미지 제거
        searchBar.searchTextField.backgroundColor = .systemGray6 // 검색창 배경색 설정
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
        imageView.image = UIImage(named: "banner_image") // 배너 이미지 설정
        imageView.contentMode = .scaleAspectFit // 이미지 비율에 맞게 조정
        return imageView
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
    
    // 컬렉션 뷰 초기화
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal  // 가로 스크롤로 설정
        layout.minimumLineSpacing = 20      // 아이템 간 세로 간격
        layout.minimumInteritemSpacing = 9 // 아이템 간 가로 간격
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16) // 컬렉션 뷰 여백 설정

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false // 가로 스크롤바 제거
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // SegmentedControl 추가
    let segmentedControl: UISegmentedControl = {
        let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        
        // 배경색 및 테두리 제거
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // 기본 상태의 텍스트 색상과 폰트 설정
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        // 선택된 상태의 텍스트 색상과 폰트 설정
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 14)], for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    // 밑줄 뷰
    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = nil
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 검색창 및 알림 버튼 추가
        view.addSubview(searchBar)
        view.addSubview(bellButton)
        
        
        // SegmentedControl 및 밑줄 추가
        view.addSubview(segmentedControl)
        view.addSubview(underlineView)
        
        
        // 배너 이미지 추가
        view.addSubview(bannerImageView)
        // 컬렉션 뷰 설정
        setupCollectionView()
        
        // 레이아웃 설정
        setupLayout()
        
        // 기본 추천 화면
        displaySelectedView(index: 0)
    }
    
    // 레이아웃 설정
    func setupLayout() {
            // 검색창 레이아웃 설정
            searchBar.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalTo(bellButton.snp.leading).offset(-8)
                make.height.equalTo(44)
            }
            
            // 알림 버튼 레이아웃 설정
            bellButton.snp.makeConstraints { make in
                make.centerY.equalTo(searchBar)
                make.trailing.equalToSuperview().offset(-16)
                make.width.height.equalTo(24)
            }
            
            // SegmentedControl 레이아웃 설정
            segmentedControl.snp.makeConstraints { make in
                make.top.equalTo(searchBar.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview().inset(16)
                make.height.equalTo(36)
            }
            
            // 밑줄 레이아웃 설정
            underlineView.snp.makeConstraints { make in
                make.top.equalTo(segmentedControl.snp.bottom).offset(2)
                make.height.equalTo(2)
                make.width.equalTo(50)  // 기본 너비 설정, 선택된 세그먼트에 따라 변경
                make.leading.equalTo(segmentedControl.snp.leading)  // 초기 위치 설정
            }
            
            // 배너 이미지 레이아웃 설정
            bannerImageView.snp.makeConstraints { make in
                make.top.equalTo(underlineView.snp.bottom).offset(16)
                make.centerX.equalToSuperview()
                make.width.equalTo(374)
                make.height.equalTo(346)
            }
            
            // 컬렉션 뷰 레이아웃 설정
            collectionView.snp.makeConstraints { make in
                make.top.equalTo(bannerImageView.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(220) // 높이 설정
            }
        }
        

    // 컬렉션 뷰 설정
    func setupCollectionView() {
        // 컬렉션 뷰 델리게이트 및 데이터소스 설정
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 컬렉션 뷰에 사용할 셀 등록
        collectionView.register(MainMenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        
        // 컬렉션 뷰를 메인 뷰에 추가
        view.addSubview(collectionView)
    }

    // 세그먼트 선택 변경 시 호출
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        updateUnderlinePosition()
        displaySelectedView(index: sender.selectedSegmentIndex)
    }

    // 밑줄 위치 업데이트
    func updateUnderlinePosition() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        let leadingOffset = segmentWidth * CGFloat(selectedIndex)

        underlineView.snp.updateConstraints { make in
            make.leading.equalTo(segmentedControl.snp.leading).offset(leadingOffset)
            make.width.equalTo(segmentWidth)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    // 선택된 세그먼트에 따라 화면 전환
    func displaySelectedView(index: Int) {
        mainView.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let selectedView: UIView
        
        switch index {
        case 0:
            selectedView = createRecommendationView()
        default:
            selectedView = createEmptyView()
        }
        
        mainView.contentView.addSubview(selectedView)
        selectedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 추천 화면을 생성하는 메서드
    func createRecommendationView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "추천 화면"
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return view
    }

    // 빈 화면을 생성하는 메서드
    func createEmptyView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "빈 화면"
        label.textAlignment = .center
        label.textColor = .lightGray
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return view
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 아이템 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    // 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MainMenuCollectionViewCell
        let menuItem = menuItems[indexPath.item]
        cell.configure(imageName: menuItem.image, title: menuItem.title)
        return cell
    }
    
    // 셀 크기 설정 (두 줄로 배치하기 위해 너비를 화면 크기의 절반으로 설정)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let itemWidth = (screenWidth - 40) / 2  // 2개씩 배치, 간격을 고려하여 너비 설정
        return CGSize(width: 61, height: 81) // 아이템 크기 설정
    }
}

