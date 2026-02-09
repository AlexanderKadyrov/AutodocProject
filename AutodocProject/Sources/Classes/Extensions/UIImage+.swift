import UIKit

extension UIImage {
    
    enum ImageName: String {
        case iconNewsPlaceholder
    }
    
    convenience init?(imageName: ImageName) {
        self.init(named: imageName.rawValue, in: Bundle.module, with: nil)
    }
}
