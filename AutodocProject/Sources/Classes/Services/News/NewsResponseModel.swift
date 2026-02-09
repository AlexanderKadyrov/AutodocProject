import Foundation

struct NewsResponseModel: Codable {
    let news: [NewsModel]
    let totalCount: Int
}
