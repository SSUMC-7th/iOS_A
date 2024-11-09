// ColorCollectionViewCell.swift
import UIKit
import SnapKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    let colorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8 // 이미지에 라운드를 추가
        imageView.layer.masksToBounds = true // 라운드 처리를 위해 클리핑 활성화
        return imageView
    }()
    
    // 선택된 상태를 표시하기 위한 뷰 추가 (선택 효과)
    let selectionOverlay: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3) // 반투명한 검은색 오버레이
        view.isHidden = true // 기본적으로 숨김 처리
        view.layer.cornerRadius = 8 // 동일하게 라운드 적용
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(colorImageView)
        contentView.addSubview(selectionOverlay) // 오버레이 추가
        
        colorImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        selectionOverlay.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupGesture() // 제스처 설정 추가
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이미지를 설정하는 메서드
    func configure(with image: UIImage?) {
        colorImageView.image = image
    }
    
    // 셀이 선택되었을 때 효과 추가
    override var isSelected: Bool {
        didSet {
            selectionOverlay.isHidden = !isSelected // 선택되었을 때만 오버레이를 보여줌
        }
    }
    
    // 셀 클릭 이벤트 처리를 위한 제스처 설정
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        // 선택 시 처리 로직 추가 (필요시 외부에서 호출할 수도 있음)
        self.isSelected.toggle()
    }
}

