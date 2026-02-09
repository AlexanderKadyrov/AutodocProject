import Foundation
import Combine
import UIKit
import UI

final class NewsCollectionCellViewModel: CollectionCellViewModel, @unchecked Sendable {
    
    let imageViewProvider: NewsAsyncImageViewProvider
    let publishedDate: String
    let model: NewsModel
    
    override var id: String {
        return "\(model.id)"
    }
    
    init(model: NewsModel) {
        self.model = model
        self.publishedDate = DateFormatter.ddMMMMyyyy.string(from: model.publishedDate)
        self.imageViewProvider = NewsAsyncImageViewProvider(url: model.titleImageUrl)
        super.init(cellIdentifier: "NewsCollectionCellView")
    }
    
    override func hash(into hasher: inout Hasher) {
        hasher.combine(cellIdentifier)
        hasher.combine(model)
    }
}
