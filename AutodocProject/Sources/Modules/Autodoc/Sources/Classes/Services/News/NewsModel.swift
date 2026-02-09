import Foundation

struct NewsModel: Codable, Hashable {
    let id: Int
    let title: String
    let description: String
    let publishedDate: Date
    let url: String
    let fullUrl: URL
    let titleImageUrl: URL?
    let categoryType: String
}
