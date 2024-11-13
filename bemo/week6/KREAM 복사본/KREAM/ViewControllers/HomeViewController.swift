//
//  HomeViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
        setupAction()
        setupDelegate()
    }
    
    private lazy var homeView:  HomeView = {
        let view = HomeView()
        return view
    }()
    
    private func setupAction() {
        homeView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate(){
        homeView.HomeCollectionView.dataSource = self
        homeView.HomeCollectionView.delegate = self
        homeView.JustDroppedCollectionView.dataSource = self
        homeView.JustDroppedCollectionView.delegate = self
        homeView.ChallengeCollectionView.dataSource = self
        homeView.ChallengeCollectionView.delegate = self
    }
    
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            homeView.HomeCollectionView.isHidden = false
            homeView.advertisement.isHidden = false
            homeView.emptyLabel.isHidden = true
        }
        else {
            homeView.HomeCollectionView.isHidden = true
            homeView.advertisement.isHidden = true
            homeView.emptyLabel.isHidden = false
        }
        
        let segmentWidth = homeView.segmentedControl.frame.width / CGFloat(homeView.segmentedControl.numberOfSegments)
        let selectedSegmentIndex = CGFloat(segment.selectedSegmentIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.homeView.underline.snp.updateConstraints {
                $0.left.equalTo(self.homeView.segmentedControl.snp.left).offset(segmentWidth * selectedSegmentIndex)
            }
            self.view.layoutIfNeeded()
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 각 컬렉션 뷰에 맞는 데이터 개수를 반환합니다.
        if collectionView == homeView.HomeCollectionView {
            return HomeModel.dummy().count
        } else if collectionView == homeView.JustDroppedCollectionView {
            return JustDroppedModel.dummy().count
        } else if collectionView == homeView.ChallengeCollectionView {
            return ChallengeModel.dummy().count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 각 컬렉션 뷰에 맞는 셀과 데이터를 설정합니다.
        if collectionView == homeView.HomeCollectionView {
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
            
        } else if collectionView == homeView.JustDroppedCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
                    for: indexPath
                ) as? JustDroppedCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let list = JustDroppedModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            cell.transactionCount.text = list[indexPath.row].transactionCount
            cell.brandName.text = list[indexPath.row].brandName
            cell.productName.text = list[indexPath.row].productName
            cell.price.text = list[indexPath.row].price
            cell.saveButton.setImage(
                UIImage(systemName: list[indexPath.row].isBookmarked ? "bookmark.fill" : "bookmark"),
                for: .normal
                
            )
            return cell
        } else if collectionView == homeView.ChallengeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ChallengeCollectionViewCell.identifier,
                    for: indexPath
                ) as? ChallengeCollectionViewCell else {
                    return UICollectionViewCell()
                }
            let list = ChallengeModel.dummy()
            cell.imageView.image = list[indexPath.row].image
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // JustDroppedCollectionView의 첫 번째 셀이 선택되었는지 확인
        if collectionView == homeView.JustDroppedCollectionView && indexPath.row == 0 {
            // 이동할 새로운 뷰 컨트롤러 생성
            let productDetailViewController = ProductDetailViewController()
            navigationController?.pushViewController(productDetailViewController, animated: true)
        }
    }
    
}

