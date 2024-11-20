import UIKit
import SnapKit
import Moya

class SerachbarTabDetailViewController: UIViewController {

    // Moya Provider 생성
    let provider = MoyaProvider<ProductAPI>(plugins: [NetworkLoggerPlugin()])  // NetworkLoggerPlugin 추가

    // 검색창 추가
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "브랜드, 상품, 프로필, 태그 등",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14) // 원하는 크기로 설정
            ]
        )
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .systemGray6
        searchBar.searchTextField.leftView = nil

        return searchBar
    }()
    
    // 취소 버튼 추가
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 추천 검색어 테이블 뷰
    let recommendedTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
        return tableView
    }()
    
    // 추천 검색어 데이터 배열
    var recommendedKeywords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 검색창과 취소 버튼 추가
        view.addSubview(searchBar)
        view.addSubview(cancelButton)
        
        // 추천 검색어 테이블 뷰 추가
        view.addSubview(recommendedTableView)
        
        searchBar.delegate = self  // 검색바 델리게이트 설정
        
        recommendedTableView.delegate = self
        recommendedTableView.dataSource = self
        
        // 레이아웃 설정
        setupLayout()
    }

    // 레이아웃 설정 메서드
    func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(cancelButton.snp.leading).offset(-8)
            make.height.equalTo(44)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        recommendedTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // 취소 버튼 클릭 시 동작
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // 검색어로 제품 검색
    func searchProducts(with query: String) {
        let urlString = "https://dummyjson.com/products/search?q=\(query)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("네트워크 오류: \(error)")
                return
            }
            
            guard let data = data else {
                print("데이터 없음")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ProductSearchResponse.self, from: data)
                self.recommendedKeywords = response.products.map { $0.title }
                DispatchQueue.main.async {
                    self.recommendedTableView.reloadData()
                }
            } catch {
                print("JSON 파싱 오류: \(error)")
            }
        }
        task.resume()
    }

}

// MARK: - UISearchBarDelegate
extension SerachbarTabDetailViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        print("검색어 입력됨: \(query)")  // 검색어 확인
        searchProducts(with: query)  // 검색어로 API 요청
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SerachbarTabDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendedKeywords.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        let keyword = recommendedKeywords[indexPath.row]
        cell.textLabel?.text = keyword
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 셀 선택 시 추가 동작 구현 (필요할 경우)
    }
}

