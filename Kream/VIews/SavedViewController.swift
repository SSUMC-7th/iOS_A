
import UIKit

class SavedViewController: UIViewController {
    
    // SavedListView 인스턴스 생성
    let savedListView = SavedListView()
    
    // 더미 데이터 배열
    var savedItems: [SavedItem] = [
        SavedItem(image: UIImage(named: "cell_image_1"), title: "하얀 음료", description: "이 음료를 마시면 건강해져요. 그런데 어디가 건강해질까요? 한 번 마셔봐요....", price: "120,000원"),
        SavedItem(image: UIImage(named: "cell_image_2"), title: "이어폰", description: "모닝 커피로 마시면 하루가 상쾌해져요!", price: "3,500원"),
        SavedItem(image: UIImage(named: "cell_image_3"), title: "옷", description: "녹차는 몸을 맑게 해줘요. 따뜻하게 한 잔 어떠세요?", price: "5,000원"),
        SavedItem(image: UIImage(named: "cell_image_4"), title: "신발", description: "홍차는 풍부한 향과 맛이 특징이에요.", price: "6,000원"),
        SavedItem(image: UIImage(named: "cell_image_5"), title: "반지", description: "우유는 칼슘이 풍부하여 뼈 건강에 좋아요.", price: "1,500원"),
        SavedItem(image: UIImage(named: "cell_image_6"), title: "긴목 신발", description: "초코 음료는 달콤한 맛이 일품이에요!", price: "4,500원"),
        SavedItem(image: UIImage(named: "cell_image_7"), title: "밥", description: "더운 여름날 시원하게 한 잔 하세요.", price: "3,000원"),
        SavedItem(image: UIImage(named: "cell_image_8"), title: "배고파", description: "상큼한 레몬 에이드로 피로를 풀어보세요.", price: "5,000원"),
        SavedItem(image: UIImage(named: "cell_image_9"), title: "새벽3시", description: "신선한 딸기가 들어간 스무디입니다.", price: "7,000원"),
        SavedItem(image: UIImage(named: "10"), title: "세상에", description: "달콤한 망고 주스를 즐겨보세요.", price: "6,500원")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // SavedListView를 뷰에 추가
        view.addSubview(savedListView)
        savedListView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 전체 화면에 맞춤
        }
        
        // 테이블 뷰 델리게이트 및 데이터 소스 설정
        savedListView.tableView.delegate = self
        savedListView.tableView.dataSource = self
        
        // 더미데이터 갯수에 맞춰 동적으로 변하도록 설정
        savedListView.itemCountLabel.text = "전체 \(savedItems.count)개"
        
        savedListView.itemCountLabel.snp.remakeConstraints { make in
                   make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50) // 아래로 50pt 이동
                   make.leading.equalToSuperview().offset(16)
               }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 테이블 뷰의 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count // 더미 데이터 배열의 개수 반환
    }
    
    // 테이블 뷰의 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCell", for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        // 배열에서 데이터 가져오기
        let item = savedItems[indexPath.row]
        
        // 셀에 데이터 설정
        cell.configure(image: item.image, title: item.title, description: item.description, price: item.price)
        
        return cell
    }
    
    // 셀이 선택되었을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}


