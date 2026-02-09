import Foundation
import Combine
import UIKit

final class NewsViewModel {
    
    let collectionDataSourceAdapter: CollectionDataSourceAdapter = {
        let adapter = CollectionDataSourceAdapter()
        adapter.append(sections: [NewsCollectionSectionViewModel()])
        return adapter
    }()
}
