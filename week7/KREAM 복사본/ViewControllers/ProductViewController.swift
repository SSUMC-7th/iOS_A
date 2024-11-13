//
//  ProductViewController.swift
//  KREAM
//
//  Created by 한태빈 on 11/9/24.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDataSource {
    private let images: [UIImage] = [
        UIImage(named: "matinkimblue")!,
        UIImage(named: "matinkimpurple")!,
        UIImage(named: "matinkimgreen")!,
        UIImage(named: "matinkimburgundy")!,
        UIImage(named: "matinkimcherry")!,
        UIImage(named: "matinkimbrown")!,
        UIImage(named: "matinkimlast")!
    ]
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    //ProductViewController랑 ProductView 연결
    private let rootView = ProductView()
    
    override func loadView() {
        self.view = rootView
        collectionView.dataSource = self
        collectionView.register(MatinKimCollectionViewCell.self, forCellWithReuseIdentifier: MatinKimCollectionViewCell.identifier)
        view.addSubview(collectionView)
        
        collectionView.frame = view.bounds
    }
    
    
    // UICollectionViewDataSource 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatinKimCollectionViewCell.identifier, for: indexPath) as! MatinKimCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
}

