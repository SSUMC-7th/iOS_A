import UIKit
import SnapKit

class ProductDetailViewController: UIViewController {

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "matinKim")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true // 둥근 모서리 적용을 위해 추가
        return imageView
    }()

    let colorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 60, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    let priceLabel2: UILabel = {
        let label = UILabel()
        label.text = "228,000원"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    let productSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "마틴킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    let bookmarkButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "bookmark")
        configuration.baseForegroundColor = .black

        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)

        // 클릭 시 하이라이트 효과 제거
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            if button.isHighlighted {
                config?.baseBackgroundColor = .clear // 하이라이트 시에도 배경색 변경 없이 유지
                button.alpha = 1.0 // 알파값 조정으로 시각적인 효과 제거
            }
            button.configuration = config
        }

        return button
    }()



        
    
    let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()

    let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("구매", for: .normal)
        button.backgroundColor = UIColor(red: 0xEF / 255.0, green: 0x62 / 255.0, blue: 0x54 / 255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchUpInside)
        return button
    }()

    let sellButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("판매", for: .normal)
        button.backgroundColor = UIColor(red: 0x41 / 255.0, green: 0xB9 / 255.0, blue: 0x7A / 255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupUI()
        setupConstraints()
    }

    func setupNavigationBar() {
        // 뒤로가기 버튼 설정
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        backButton.tintColor = .black // 버튼 색상 설정
        navigationItem.leftBarButtonItem = backButton
    }

    func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(colorCollectionView)
        view.addSubview(priceLabel)
        view.addSubview(priceLabel2)
        view.addSubview(productTitleLabel)
        view.addSubview(productSubtitleLabel)
        view.addSubview(separatorLine)
        view.addSubview(bookmarkButton)
        view.addSubview(purchaseButton)
        view.addSubview(sellButton)
        
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        colorCollectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
    }

    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(374)
        }
        
        colorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(colorCollectionView.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(16)
        }
        priceLabel2.snp.makeConstraints { make in
            make.bottom.equalTo(priceLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
        }
        
        
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel2.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(16)
        }
        
        productSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(16)
        }

        separatorLine.snp.makeConstraints { make in
                    make.top.equalTo(productSubtitleLabel.snp.bottom).offset(54)
                    make.leading.trailing.equalToSuperview().inset(16)
                    make.height.equalTo(1)
        }
                
        bookmarkButton.snp.makeConstraints { make in
                    make.top.equalTo(separatorLine.snp.bottom).offset(16)
                    make.leading.equalToSuperview().offset(16)
                    make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
                    make.width.height.equalTo(40)
        }
                
        purchaseButton.snp.makeConstraints { make in
                    make.centerY.equalTo(bookmarkButton.snp.centerY)
                    make.leading.equalTo(bookmarkButton.snp.trailing).offset(16)
                    make.height.equalTo(49)
                    make.width.equalTo(147)
        }
                
        sellButton.snp.makeConstraints { make in
                    make.centerY.equalTo(purchaseButton.snp.centerY)
                    make.leading.equalTo(purchaseButton.snp.trailing).offset(16)
                    make.height.equalTo(49)
                    make.width.equalTo(147)
        }
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc func purchaseButtonTapped() {
        let purchaseSheet = PurchaseSheetViewController()
        purchaseSheet.modalPresentationStyle = .pageSheet
        present(purchaseSheet, animated: true, completion: nil)
    }
    
    @objc func bookmarkButtonTapped() {
           bookmarkButton.isSelected.toggle()
           let imageName = bookmarkButton.isSelected ? "bookmark.fill" : "bookmark"
           bookmarkButton.setImage(UIImage(systemName: imageName), for: .normal)
           bookmarkButton.tintColor = .black // 버튼 색상은 검정색으로 설정
       }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6 // 이미지 수에 맞춰 수정
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCollectionViewCell else {
            fatalError("Could not dequeue ColorCollectionViewCell")
        }
        // 반복문을 이용하여 이미지 설정
        let imageName = "color_\(indexPath.item + 1)"
        cell.configure(with: UIImage(named: imageName))
        return cell
    }
}
