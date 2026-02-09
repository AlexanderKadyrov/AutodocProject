import Foundation
import Combine
import UIKit
import DI
import UI

final class NewsCollectionCellView: UICollectionViewCell, CollectionCellView {
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: AsyncImageView = {
        let view = AsyncImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [headerView, imageView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    var viewModel: NewsCollectionCellViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        unbind()
    }
    
    private func configureUI() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 15
        clipsToBounds = true
        
        contentView.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).priority(.defaultHigh),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        imageView.heightAnchor.constraint(
            equalTo: contentView.widthAnchor,
            multiplier: 0.7
        ).isActive = UIDevice.isPhone
    }
    
    func configure(viewModel: NewsCollectionCellViewModel) {
        unbind()
        bind()
    }
    
    private func unbind() {
        headerView.title = nil
        headerView.subtitle = nil
        headerView.date = nil
        headerView.category = nil
        imageView.provider = nil
    }
    
    private func bind() {
        headerView.title = viewModel?.model.title
        headerView.subtitle = viewModel?.model.description
        headerView.date = viewModel?.publishedDate
        headerView.category = viewModel?.model.categoryType
        imageView.provider = viewModel?.imageViewProvider
    }
}
