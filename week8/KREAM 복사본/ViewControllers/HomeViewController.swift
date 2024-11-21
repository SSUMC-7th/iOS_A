import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let rootView = Homeview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        setupAction()
        setupDelegate()
        setupSearchBar()
    }
    
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        rootView.HomeCollectionView.dataSource = self
        rootView.HomeCollectionView.delegate = self
        rootView.JustDroppedCollectionView.dataSource = self
        rootView.JustDroppedCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.HomeCollectionView.isHidden = false
            rootView.JustDroppedCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        } else {
            rootView.HomeCollectionView.isHidden = true
            rootView.JustDroppedCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rootView.HomeCollectionView {
            return HomeModel.Makedummy().count
        } else if collectionView == rootView.JustDroppedCollectionView {
            return JustDroppedModel.MakeDummy2().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == rootView.HomeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCollectionViewCell.identifier,
                    for: indexPath
                ) as? HomeCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let list = HomeModel.Makedummy()
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].name
            return cell
            
        } else if collectionView == rootView.JustDroppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                    for: indexPath
                ) as? JustDroppedCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let list = JustDroppedModel.MakeDummy2()
            cell.imageView.image = list[indexPath.row].image
            cell.titleLabel.text = list[indexPath.row].transactionCount
            cell.brandLabel.text = list[indexPath.row].brandName
            cell.productLabel.text = list[indexPath.row].productName
            cell.priceLabel.text = list[indexPath.row].price
            cell.nowBuyingLabel.text = list[indexPath.row].buyNowLabel
            cell.saveButton.setImage(
                UIImage(systemName: list[indexPath.row].isBookmarked ? "bookmark.fill" : "bookmark"),
                for: .normal
            )
            return cell
        }
        return UICollectionViewCell()
    }
}


extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // JustDroppedCollectionView에서 셀이 클릭되었는지 확인
        if collectionView == rootView.JustDroppedCollectionView {
            // ProductViewController로 이동
            let productViewController = ProductViewController()
            
            navigationController?.pushViewController(productViewController, animated: true)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func setupSearchBar() {
        // searchBar의 delegate 설정
        rootView.searchBar.delegate = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // SearchViewController로 이동
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}

