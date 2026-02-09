import Foundation
import Combine
import UIKit
import UI

final class NewsViewModel {
    
    let collectionDataSourceAdapter: CollectionDataSourceAdapter = {
        let adapter = CollectionDataSourceAdapter()
        adapter.append(sections: [NewsCollectionSectionViewModel()])
        return adapter
    }()
}
