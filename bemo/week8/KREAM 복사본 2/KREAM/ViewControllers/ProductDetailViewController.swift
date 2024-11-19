//
//  ProductDetailViewController.swift
//  KREAM
//
//  Created by 임효진 on 11/8/24.
//

import UIKit

class ProductDetailViewController: UIViewController, UICollectionViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = productDetailView

        setupDelegate()
        // Do any additional setup after loading the view.
    }
    
    private lazy var productDetailView:  ProductDetailView = {
        let view = ProductDetailView()
        view.buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        return view
    }()

    private func setupDelegate(){
        productDetailView.otherColorsColletionView.dataSource = self
        productDetailView.otherColorsColletionView.delegate = self
    }
    
    @objc
    private func buyButtonTapped(){
        let viewController = BuyViewController()
        
        viewController.modalPresentationStyle = .pageSheet
        
        present(viewController, animated: true)
    }
}

extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ColorModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OtherColorsCollectionViewCell.identifier,
                for: indexPath
            ) as? OtherColorsCollectionViewCell else {
                return UICollectionViewCell()
            }
        let list = ColorModel.dummy()
        cell.imageView.image = list[indexPath.row].image
        return cell
    }
}
