import Foundation

struct NewsServiceImpl: NewsService {
    
    private enum Errors: Error {
        case badURL
    }
    
    @DI(\.httpClient) private var httpClient: HTTPClient
    
    func fetchNews(offset: Int, limit: Int) async throws -> NewsResponseModel {
        guard let url = URL(string: "https://webapi.autodoc.ru/api/news/\(offset)/\(limit)") else {
            throw Errors.badURL
        }
        let data = try await httpClient.fetchRequest(url: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMddTHHmmss)
        let response = try decoder.decode(NewsResponseModel.self, from: data)
        return response
    }
}
