import UIKit
import SnapKit

// UI 관련 유틸리티 메서드들을 제공하는 클래스
class UIHelpers {

    /// Segmented Control에서 선택된 인덱스에 맞춰 밑줄 위치를 업데이트하는 메서드
    /// - Parameters:
    ///   - underlineView: 업데이트할 밑줄 뷰
    ///   - segmentedControl: 대상이 되는 Segmented Control
    ///   - selectedIndex: 선택된 인덱스
    static func updateUnderlinePosition(underlineView: UIView, segmentedControl: UISegmentedControl, selectedIndex: Int) {
        let segmentWidth = segmentedControl.frame.width / CGFloat(segmentedControl.numberOfSegments)
        underlineView.snp.updateConstraints { make in
            make.width.equalTo(segmentWidth)
            make.leading.equalTo(segmentedControl.snp.leading).offset(segmentWidth * CGFloat(selectedIndex))
        }
        
        UIView.animate(withDuration: 0.3) {
            underlineView.superview?.layoutIfNeeded()
        }
    }
    
    /// 기본 설정된 UILabel을 생성하는 메서드
    /// - Parameters:
    ///   - text: 라벨에 표시할 텍스트
    ///   - font: 라벨의 폰트
    ///   - textColor: 라벨의 텍스트 색상
    /// - Returns: 구성된 UILabel 인스턴스
    static func createLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }

    /// 기본 설정된 UIView 구분선을 생성하는 메서드
    /// - Parameters:
    ///   - color: 구분선의 색상 (기본값: systemGray5)
    ///   - height: 구분선의 높이 (기본값: 1)
    /// - Returns: 구성된 UIView 인스턴스
    static func createSeparatorLine(color: UIColor = .systemGray5, height: CGFloat = 1) -> UIView {
        let separatorLine = UIView()
        separatorLine.backgroundColor = color
        separatorLine.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
        return separatorLine
    }
}

