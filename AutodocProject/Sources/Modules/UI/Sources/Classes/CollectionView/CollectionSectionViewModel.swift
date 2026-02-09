import Foundation
import Combine

class CollectionSectionViewModel: Hashable, @unchecked Sendable {
    
    @Published private(set) var cellViewModels: [CollectionCellViewModel] = []
    
    var id: String {
        return String(describing: self)
    }
    
    func append(cellViewModels models: [CollectionCellViewModel]) {
        cellViewModels.union(cellViewModels: models)
    }
    
    func cellViewModelAt<T: CollectionCellViewModel>(index: Int) -> T? {
        return cellViewModels[safe: index] as? T
    }
    
    func didSelectItemAt(index: Int) {
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: CollectionSectionViewModel, rhs: CollectionSectionViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
