import UIKit

final class NewsViewController: UIViewController {
    
    var viewModel: NewsViewModel? {
        didSet {
            bind()
        }
    }
    
    private var collectionViewLayout: NewsCollectionViewLayout {
        return NewsCollectionViewLayout()
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(NewsCollectionCellView.self, forCellWithReuseIdentifier: "NewsCollectionCellView")
        return view
    }()
    
    private lazy var dataSource = CollectionDataSource(collectionView: collectionView)
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Новости"
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func bind() {
        dataSource.adapter = viewModel?.collectionDataSourceAdapter
    }
}
