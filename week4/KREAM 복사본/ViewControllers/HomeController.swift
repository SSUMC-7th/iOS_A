//  Created by 한태빈 on 10/14/24.
//
import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let rootView = Homeview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view = rootView
        
        setupAction()
        setupDelegate()
    }
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate(){
        rootView.HomeCollectionView.dataSource = self
        rootView.HomeCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.HomeCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        }
        else {
            rootView.HomeCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCollectionViewCell.identifier,
                    for: indexPath
                ) as? HomeCollectionViewCell else {
                    return UICollectionViewCell()
                }
        let list = HomeModel.dummy()
        
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
        return cell
    }
    
    
}
