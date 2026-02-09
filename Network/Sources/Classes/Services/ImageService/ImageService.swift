import Foundation
import UIKit

protocol ImageService {
    func fetchImage(url: URL) async throws -> UIImage
}
