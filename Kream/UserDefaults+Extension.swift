import UIKit

// UserDefaults에 UIImage를 저장하고 불러오는 확장 기능 정의
extension UserDefaults {
    // UIImage를 UserDefaults에 저장
    func setImage(_ image: UIImage, forKey key: String) {
        if let imageData = image.pngData() {
            self.set(imageData, forKey: key)
        }
    }
    
    // UserDefaults에서 UIImage를 불러오기
    func image(forKey key: String) -> UIImage? {
        if let imageData = self.data(forKey: key) {
            return UIImage(data: imageData)
        }
        return nil
    }
}

