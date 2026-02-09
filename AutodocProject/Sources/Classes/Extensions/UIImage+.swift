import UIKit

extension UIImage {
    
    enum ImageName: String {
        case iconNewsPlaceholder
    }
    
    convenience init?(imageName: ImageName) {
        self.init(named: imageName.rawValue)
    }
}
