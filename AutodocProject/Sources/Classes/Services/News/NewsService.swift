import Foundation

protocol NewsService {
    func fetchNews(offset: Int, limit: Int) async throws -> NewsResponseModel
}
