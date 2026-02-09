import Foundation

protocol HTTPClient {
    func fetchRequest(url: URL) async throws -> Data
}
