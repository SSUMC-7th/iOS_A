//
//  TableViewCell.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

class SavedCell: UITableViewCell {

    static let identifier = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImageView.image = nil
        self.productTitle.text = nil
        self.productContent.text = nil
        self.productPrice.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var productTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = UIColor.black
        return title
    }()
    
    private lazy var productContent: UILabel = {
        let content = UILabel()
        content.font = UIFont.systemFont(ofSize: 9)
        content.textColor = UIColor(red: 161/255, green: 161/255, blue: 161/255, alpha: 1.0)
        return content
    }()
    
    private lazy var productPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.boldSystemFont(ofSize: 14)
        price.textColor = UIColor.black
        return price
    }()
    
    private lazy var savedButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "찜하기 버튼")
        return imageView
    }()
    
    private func setViews() {
        self.addSubview(productImageView)
        self.addSubview(productTitle)
        self.addSubview(productContent)
        self.addSubview(productPrice)
        self.addSubview(savedButton)
    }
    
    private func setConstaints() {
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-13)
            $0.width.height.equalTo(72)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(productImageView.snp.right).offset(13)
        }
        
        productContent.snp.makeConstraints{
            $0.top.equalTo(productTitle.snp.bottom).offset(5)
            $0.left.equalTo(productImageView.snp.right).offset(13)
        }
        
        productPrice.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        savedButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-17)
            $0.top.equalToSuperview().offset(18)
        }
    }
    
    public func configure(model: SavedModel) {
        self.productImageView.image = UIImage(named: model.image)
        self.productTitle.text = model.title
        self.productContent.text = model.content
        self.productPrice.text = model.price
    }

}
