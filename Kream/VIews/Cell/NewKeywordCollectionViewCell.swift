import UIKit
import Foundation

import SnapKit

class KeywordCollectionViewCell: UICollectionViewCell {
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCellLayout() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.clipsToBounds = true

        contentView.addSubview(keywordLabel)
        keywordLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 7, left: 11, bottom: 7, right: 11))
        }
    }

    // configure 메서드를 KeywordModel 타입을 받도록 수정
    func configure(with keyword: KeywordModel) {
        keywordLabel.text = keyword.title
    }
}

