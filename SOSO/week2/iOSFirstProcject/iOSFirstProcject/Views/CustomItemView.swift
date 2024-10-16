//
//  CustomItemView.swift
//  iOSFirstProcject
//
//  Created by 소민준 on 10/16/24.
//

import UIKit
import SnapKit

class CustomView: UIView {
    private let items: [HomeModel] = HomeModel.dummy()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        var lastView: UIView? = nil
        
        // 첫 번째 줄
        for i in 0..<5 {
            let itemView = createItemView(for: items[i])
            addSubview(itemView)

            itemView.snp.makeConstraints { make in
                if let lastView = lastView {
                    make.leading.equalTo(lastView.snp.trailing).offset(6)
                } else {
                    make.leading.equalToSuperview().offset(16)
                }
                make.top.equalToSuperview().offset(20)
                make.width.equalTo(61)
                make.height.equalTo(81)
            }
            lastView = itemView
        }
        
        // 두 번째 줄
        lastView = nil
        for i in 5..<10 {
            let itemView = createItemView(for: items[i])
            addSubview(itemView)

            itemView.snp.makeConstraints { make in
                if let lastView = lastView {
                    make.leading.equalTo(lastView.snp.trailing).offset(6)
                } else {
                    make.leading.equalToSuperview().offset(16)
                }
                make.top.equalToSuperview().offset(110) // 첫 줄에서의 높이 차
                make.width.equalTo(61)
                make.height.equalTo(81)
            }
            lastView = itemView
        }
    }

    private func createItemView(for item: HomeModel) -> UIView {
        let containerView = UIView()

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: item.imageName)
        containerView.addSubview(imageView)

        let titleLabel = UILabel()
        titleLabel.text = item.title
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        containerView.addSubview(titleLabel)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(61)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }

        return containerView
    }
}

