import Foundation
import Combine

final class NewsCollectionSectionViewModel: PageableCollectionSectionViewModel, @unchecked Sendable {
    
    private enum Constants {
        static let offsetInitial = 1
        static let offsetLimit = 15
    }
    
    @DI(\.routerManager) private var routerManager
    
    private var fetchNewsTask: Task<Void, Never>?
    private var cancellables: [AnyCancellable] = []
    
    private var offset = Constants.offsetInitial
    
    private var nextNewsAvailable = false
    override var pageableAvailable: Bool {
        return nextNewsAvailable
    }
    
    override init() {
        super.init()
        bind()
        fetchNews()
    }
    
    private func bind() {
        pageablePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                fetchNews()
            }
            .store(in: &cancellables)
    }
    
    private func fetchNews() {
        fetchNewsTask?.cancel()
        fetchNewsTask = nil
        fetchNewsTask = Task { [weak self] in
            guard let self else { return }
            do {
                @DI(\.newsService) var newsService
                let response = try await newsService.fetchNews(offset: offset, limit: Constants.offsetLimit)
                let cellViewModels = response.news.map { NewsCollectionCellViewModel(model: $0) }
                if Task.isCancelled {
                    return
                }
                nextNewsAvailable = !cellViewModels.isEmpty
                refresh(offset: cellViewModels.count)
                append(cellViewModels: cellViewModels)
            } catch {
                
            }
        }
    }
    
    private func refresh(offset newValue: Int) {
        offset = offset == Constants.offsetInitial ? newValue : (offset + newValue)
    }
    
    override func didSelectItemAt(index: Int) {
        guard let cellViewModel: NewsCollectionCellViewModel = cellViewModelAt(index: index) else { return }
        let fullUrl = cellViewModel.model.fullUrl
        routerManager.open(url: fullUrl)
    }
}
