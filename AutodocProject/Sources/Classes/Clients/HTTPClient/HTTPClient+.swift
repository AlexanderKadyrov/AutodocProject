import Foundation

fileprivate extension DIStorage {
    struct HTTPClientKey: DIKey {
        nonisolated(unsafe) static var currentValue: HTTPClient = HTTPClientImpl()
    }
}

extension DIStorage {
    var httpClient: HTTPClient {
        get { Self[HTTPClientKey.self] }
        set { Self[HTTPClientKey.self] = newValue }
    }
}
