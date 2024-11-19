//
//  ProductViewController.swift
//  KREAM
//
//  Created by 한태빈 on 11/9/24.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDataSource {
    private let products = MatinKimModel.Makedummy()
    
    private let rootView = ProductView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rootView.MatinKimCollectionView.dataSource = self
    }
    
    // UICollectionViewDataSource 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatinKimCollectionViewCell.identifier, for: indexPath) as! MatinKimCollectionViewCell
        let product = products[indexPath.item]
        cell.imageView.image = product.image
        return cell
    }
}
