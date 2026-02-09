import Foundation
import UIKit

struct ImageServiceImpl: ImageService {
    
    private enum Errors: Error {
        case badImage
    }
    
    @DI(\.httpClient) private var httpClient: HTTPClient
    
    private let cache = NSCache<NSURL, ImageCache>()
    
    func fetchImage(url: URL) async throws -> UIImage {
        return try await fetchOrCachedImage(url: url)
    }
    
    private func fetchOrCachedImage(url: URL) async throws -> UIImage {
        if let imageCache = cache.object(forKey: url as NSURL) {
            return imageCache.image
        }
        let data = try await httpClient.fetchRequest(url: url)
        guard let image = UIImage(data: data) else {
            throw Errors.badImage
        }
        let imageCache = ImageCache(image: image)
        cache.setObject(imageCache, forKey: url as NSURL)
        return image
    }
}
