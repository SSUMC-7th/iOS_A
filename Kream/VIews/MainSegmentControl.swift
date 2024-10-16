import UIKit
import SnapKit

class MainSegmentControl: UIView {

    // UISegmentedControl 선언
    private let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        segment.selectedSegmentIndex = 0 // 초기 선택된 세그먼트 설정
        segment.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return segment
    }()

    // 하단 밑줄 뷰
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // 밑줄 색상 설정
        return view
    }()

    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubview(segmentedControl)
        addSubview(underlineView)

        // SnapKit을 이용한 레이아웃 설정
        segmentedControl.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(40) // 세그먼트 높이
        }

        underlineView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.height.equalTo(2) // 밑줄 두께
            make.width.equalTo(self.snp.width).dividedBy(segmentedControl.numberOfSegments)
            make.leading.equalTo(segmentedControl.snp.leading)
        }
    }

    // 세그먼트가 변경될 때 호출되는 메서드
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex

        // 선택된 세그먼트에 따라 밑줄 이동 애니메이션
        UIView.animate(withDuration: 0.3) {
            self.underlineView.snp.remakeConstraints { make in
                make.top.equalTo(self.segmentedControl.snp.bottom)
                make.height.equalTo(2)
                make.width.equalTo(self.snp.width).dividedBy(self.segmentedControl.numberOfSegments)
                make.leading.equalTo(self.segmentedControl.snp.leading).offset(CGFloat(selectedIndex) * (self.frame.width / CGFloat(self.segmentedControl.numberOfSegments)))
            }
            self.layoutIfNeeded()
        }
    }
}

