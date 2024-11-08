import UIKit
import SnapKit

class ProductView: UIView {
    
    private let mainproductImageView = UIImageView().then {
        $0.image = UIImage(named: "matinkimblack")
        $0.contentMode = .scaleAspectFit
    }
    
    let MatinKimCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 53, height: 53)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
    }
    
    private let buynowprice = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.textColor = .black
    }
    
    private let productprice = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .black
    }
    
    private let productname = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private let productkname = UILabel().then {
        $0.text = "마땡킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    }
    
    private let divideLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // 모든 UI 요소를 뷰에 추가
        addSubview(mainproductImageView)
        addSubview(MatinKimCollectionView)
        addSubview(productname)
        addSubview(productkname)
        addSubview(buynowprice)
        addSubview(productprice)
        addSubview(divideLine)
    }
    
    private func setupLayout() {
        // mainproductImageView 레이아웃
        mainproductImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(373)
            make.width.equalTo(374)
        }
        
        // MatinKimCollectionView 레이아웃
        MatinKimCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainproductImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(53)
        }
        
        // buynowprice 레이아웃
        buynowprice.snp.makeConstraints { make in
            make.top.equalTo(MatinKimCollectionView.snp.bottom).offset(23)
            make.leading.equalToSuperview().inset(16)
        }
        
        // productprice 레이아웃
        productprice.snp.makeConstraints { make in
            make.top.equalTo(buynowprice.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(16)
        }
        
        // productname 레이아웃
        productname.snp.makeConstraints { make in
            make.top.equalTo(productprice.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // productkname 레이아웃
        productkname.snp.makeConstraints { make in
            make.top.equalTo(productname.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // divideLine 레이아웃
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(productkname.snp.bottom).offset(54)
            make.height.equalTo(1)
        }
    }
}
