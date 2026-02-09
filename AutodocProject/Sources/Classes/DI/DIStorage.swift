import Foundation

struct DIStorage {
    
    nonisolated(unsafe) private static var currentValue = DIStorage()
    
    static subscript<K: DIKey>(key: K.Type) -> K.Value {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    static subscript<T>(_ keyPath: WritableKeyPath<DIStorage, T>) -> T {
        get { currentValue[keyPath: keyPath] }
        set { currentValue[keyPath: keyPath] = newValue }
    }
}
