import Foundation

@propertyWrapper
struct DI<T> {
    
    private let keyPath: WritableKeyPath<DIStorage, T>
    
    var wrappedValue: T {
        get { DIStorage[keyPath] }
        set { DIStorage[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<DIStorage, T>) {
        self.keyPath = keyPath
    }
}
