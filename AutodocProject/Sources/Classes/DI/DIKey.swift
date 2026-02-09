import Foundation

protocol DIKey {
    
    associatedtype Value
    
    static var currentValue: Value { get set }
}
