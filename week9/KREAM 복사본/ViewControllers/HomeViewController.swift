import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let rootView = Homeview()
    private var homeList = HomeModel.Makedummy()
    private var justDroppedList = JustDroppedModel.MakeDummy2()
    
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
        
        // 셀 등록
        rootView.HomeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        rootView.JustDroppedCollectionView.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
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
            return homeList.count
        } else if collectionView == rootView.JustDroppedCollectionView {
            return justDroppedList.count
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
            let model = homeList[indexPath.row]
            cell.imageView.image = model.image
            cell.titleLabel.text = model.name
            return cell
        } else if collectionView == rootView.JustDroppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                for: indexPath
            ) as? JustDroppedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let model = justDroppedList[indexPath.row]
            if let imageUrl = model.image {
                cell.imageView.kf.setImage(with: imageUrl)
            } else {
                cell.imageView.image = UIImage(named: "placeholder")
            }
            cell.titleLabel.text = model.transactionCount
            cell.brandLabel.text = model.brandName
            cell.productLabel.text = model.productName
            cell.priceLabel.text = model.price
            cell.nowBuyingLabel.text = model.buyNowLabel
            cell.saveButton.setImage(
                UIImage(systemName: model.isBookmarked ? "bookmark.fill" : "bookmark"),
                for: .normal
            )
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func setupSearchBar() {
        rootView.searchBar.delegate = self
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchViewController = SearchViewController()
        if let navigationController = navigationController {
            navigationController.pushViewController(searchViewController, animated: true)
        } else {
            present(searchViewController, animated: true, completion: nil)
        }
    }
}
