import Foundation
import DI

fileprivate extension DIStorage {
    struct NewsServiceKey: DIKey {
        nonisolated(unsafe) static var currentValue: NewsService = NewsServiceImpl()
    }
}

extension DIStorage {
    var newsService: NewsService {
        get { Self.self[NewsServiceKey.self] }
        set { Self.self[NewsServiceKey.self] = newValue }
    }
}
