import Foundation

class CollectionCellViewModel: Hashable, @unchecked Sendable {
    
    let cellIdentifier: String
    
    var id: String {
        return cellIdentifier
    }
    
    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CollectionCellViewModel, rhs: CollectionCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
