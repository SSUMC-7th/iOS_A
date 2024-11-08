import UIKit

class HomeViewController: UIViewController {

    private let rootView = MainHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = rootView

        // 컬렉션 뷰 셀 등록
        rootView.homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        rootView.homeCollectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)

        setupDelegate()
    }

    private func setupDelegate() {
        rootView.homeCollectionView.dataSource = self
        rootView.homeCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // HomeModel과 JustDroppedModel의 항목 수를 합산하여 반환
        return HomeModel.dummy().count + JustDroppedModel.MakeDummy2().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // HomeModel의 항목인지, JustDroppedModel의 항목인지 구분
        let homeModelCount = HomeModel.dummy().count
        if indexPath.row < homeModelCount {
            // HomeModel에 해당하는 셀
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCollectionViewCell.identifier,
                    for: indexPath
                ) as? HomeCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let model = HomeModel.dummy()[indexPath.row]
            cell.configure(with: model)
            return cell
        } else {
            // JustDroppedModel에 해당하는 셀
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                    for: indexPath
                ) as? JustDroppedCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let model = JustDroppedModel.MakeDummy2()[indexPath.row - homeModelCount]
            cell.configure(with: model)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let homeModelCount = HomeModel.dummy().count
        if indexPath.row < homeModelCount {
            return CGSize(width: 60, height: 80) // HomeCollectionViewCell 크기
        } else {
            return CGSize(width: 150, height: 250) // JustDroppedCollectionViewCell 크기
        }
    }
}

