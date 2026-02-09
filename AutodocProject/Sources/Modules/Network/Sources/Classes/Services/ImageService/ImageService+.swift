import Foundation

fileprivate extension DIStorage {
    struct ImageServiceKey: DIKey {
        nonisolated(unsafe) static var currentValue: ImageService = ImageServiceImpl()
    }
}

extension DIStorage {
    var imageService: ImageService {
        get { Self.self[ImageServiceKey.self] }
        set { Self.self[ImageServiceKey.self] = newValue }
    }
}
