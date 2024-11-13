//
//  HomeCollectionViewManager.swift
//  KREAM
//
//  Created by 임효진 on 11/9/24.
//

import UIKit

class HomeCollectionViewManager:  NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var viewController: HomeViewController?
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
    func setupDelegates(for homeView: HomeView) {
        homeView.HomeCollectionView.dataSource = self
        homeView.HomeCollectionView.delegate = self
        homeView.JustDroppedCollectionView.dataSource = self
        homeView.JustDroppedCollectionView.delegate = self
        homeView.ChallengeCollectionView.dataSource = self
        homeView.ChallengeCollectionView.delegate = self
    }
    
    func updateViewForSegment(segmentIndex: Int, homeView: HomeView) {
        let isHomeCollectionVisible = (segmentIndex == 0)
        homeView.HomeCollectionView.isHidden = !isHomeCollectionVisible
        homeView.advertisement.isHidden = !isHomeCollectionVisible
        homeView.emptyLabel.isHidden = isHomeCollectionVisible
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell {
            cell.configure(with: HomeModel.dummy()[indexPath.row])
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JustDroppedCollectionViewCell.identifier, for: indexPath) as? JustDroppedCollectionViewCell {
            cell.configure(with: JustDroppedModel.dummy()[indexPath.row])
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChallengeCollectionViewCell.identifier, for: indexPath) as? ChallengeCollectionViewCell {
            cell.configure(with: ChallengeModel.dummy()[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == homeView.JustDroppedCollectionView && indexPath.row == 0 {
            viewController?.navigateToProductDetail()
        }
    }
}
