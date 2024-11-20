import UIKit
import SnapKit

class SearchBarTabViewController: UIViewController {
    
    // 검색창 대체 UIView 추가
    let searchBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "브랜드, 상품, 프로필, 태그 등"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(label)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
        view.addGestureRecognizer(tapGesture)
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        return view
    }()
    
    // 취소 버튼 추가
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 추천 검색어 레이블
    let recommendedLabel: UILabel = {
        let label = UILabel()
        label.text = "추천 검색어"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // 추천 검색어 컬렉션 뷰
    let recommendedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(NewKeywordCollectionViewCell.self, forCellWithReuseIdentifier: "NewKeywordCell")
        return collectionView
    }()
    
    // 추천 검색어 데이터 배열
    var recommendedKeywords: [String] = [
        "채원 슈프림 후리스", "나이키V2K런", "뉴발란드996", "신상 나이키 콜라보", "허그 FW 패딩", "벨루어 눕시"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 검색창과 취소 버튼 추가
        view.addSubview(searchBarView)
        view.addSubview(cancelButton)
        
        // 추천 검색어 레이블 추가
        view.addSubview(recommendedLabel)
        
        // 추천 검색어 컬렉션 뷰 추가
        view.addSubview(recommendedCollectionView)
        
        searchBarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchBarTapped)))
        
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self

        // 레이아웃 설정
        setupLayout()
    }
    
    // 레이아웃 설정 메서드
    func setupLayout() {
        searchBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(cancelButton.snp.leading).offset(-8)
            make.height.equalTo(44)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBarView)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        recommendedLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBarView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
        }
        
        recommendedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendedLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // 검색창 클릭 시 동작
    @objc func searchBarTapped() {
        let searchBarDetailViewController = SerachbarTabDetailViewController()
        navigationController?.pushViewController(searchBarDetailViewController, animated: true)
    }

    // 취소 버튼 클릭 시 동작
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchBarTabViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedKeywords.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewKeywordCell", for: indexPath) as! NewKeywordCollectionViewCell
        cell.configure(with: recommendedKeywords[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let keyword = recommendedKeywords[indexPath.item]
        let width = keyword.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + 32
        return CGSize(width: width, height: 36)
    }
}

// MARK: - NewKeywordCollectionViewCell 정의
class NewKeywordCollectionViewCell: UICollectionViewCell {
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray6 // 연한 회색 배경
        label.layer.cornerRadius = 16 // 둥근 모서리
        label.clipsToBounds = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(keywordLabel)
        keywordLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 셀 크기에 딱 맞게 배치
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with keyword: String) {
        keywordLabel.text = keyword
    }
}
