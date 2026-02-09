import Foundation
import Combine
import UIKit

final class CollectionDataSource: UICollectionViewDiffableDataSource<CollectionSectionViewModel, CollectionCellViewModel> {
    
    private var cancellables: [AnyCancellable] = []
    
    var adapter: CollectionDataSourceAdapter? {
        didSet {
            bind()
        }
    }
    
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { collectionView, indexPath, viewModel in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as? (any CollectionCellView)
            cell?.configure(viewModel: viewModel)
            return cell
        }
        collectionView.register(PageableCollectionCellView.self, forCellWithReuseIdentifier: "PageableCollectionCellView")
        collectionView.delegate = self
    }
    
    private func bind() {
        adapter?.snapshotPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] snapshot in
                guard let self else { return }
                apply(snapshot)
            }
            .store(in: &cancellables)
    }
}

extension CollectionDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        adapter?.didSelectItemAt(indexPath: indexPath)
    }
}
