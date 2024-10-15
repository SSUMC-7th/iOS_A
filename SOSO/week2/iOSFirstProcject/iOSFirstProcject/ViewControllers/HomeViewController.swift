//
//  HomeViewController.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/6/24.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {

    // MainHomeView를 사용하여 세그먼트 컨트롤과 컬렉션 뷰 관리
    private let rootView = MainHomeView()



    override func viewDidLoad() {
        super.viewDidLoad()

        view = rootView

        // HomeCollectionView 셀 등록
        rootView.HomeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)

        setupAction()
        setupDelegate()
    }

    // 액션 설정 (세그먼트 컨트롤과 검색창 탭 이벤트 추가)
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )

        // 검색 창 탭 이벤트 처리
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBarTapped))
        rootView.searchBar.isUserInteractionEnabled = true
        rootView.searchBar.addGestureRecognizer(tapGesture)
    }

    private func setupDelegate() {
        rootView.HomeCollectionView.dataSource = self
        rootView.HomeCollectionView.delegate = self
    }

    // 검색창 클릭 시 SearchViewController로 이동
    @objc
    private func searchBarTapped() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }

    // 세그먼트 컨트롤 이벤트 처리
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.HomeCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = true
        } else {
            rootView.HomeCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
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
        cell.titleLabel.text = list[indexPath.row].title
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout (셀 크기 조정)
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40) / 5 // 가로에 5개씩 표시
        return CGSize(width: width, height: 100)
    }
}
