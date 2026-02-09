import Foundation
import UIKit

protocol AsyncImageViewProvider: Sendable {
    func fetchImage() async -> UIImage?
}
