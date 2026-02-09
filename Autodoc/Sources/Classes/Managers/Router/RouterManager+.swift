import Foundation
import DI

fileprivate extension DIStorage {
    struct RouterManagerKey: DIKey {
        nonisolated(unsafe) static var currentValue: RouterManager = RouterManagerImpl()
    }
}

extension DIStorage {
    var routerManager: RouterManager {
        get { Self.self[RouterManagerKey.self] }
        set { Self.self[RouterManagerKey.self] = newValue }
    }
}
