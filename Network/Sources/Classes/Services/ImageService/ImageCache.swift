import Foundation
import UIKit

final class ImageCache {
    
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
}

extension ImageCache: NSDiscardableContent {
    
    func beginContentAccess() -> Bool {
        return true
    }
    
    func isContentDiscarded() -> Bool {
        return false
    }
    
    func discardContentIfPossible() {
        
    }
    
    func endContentAccess() {
        
    }
}
