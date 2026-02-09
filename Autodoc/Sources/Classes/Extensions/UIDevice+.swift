import UIKit

extension UIDevice {
    
    static var isPortrait: Bool {
        return current.orientation.isPortrait
    }
    
    static var isPhone: Bool {
        return current.userInterfaceIdiom == .phone
    }
}
