import UIKit

final class AsyncImageView: UIImageView {
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .white
        return view
    }()
    
    private var fetchImageTask: Task<Void, Never>?
    
    var provider: (any AsyncImageViewProvider)? {
        didSet {
            provider == nil ? fetchImageCancel() : fetchImage()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    private func configureUI() {
        addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func fetchImageCancel() {
        fetchImageTask?.cancel()
        fetchImageTask = nil
        image = nil
    }
    
    private func fetchImage() {
        fetchImageCancel()
        fetchImageTask = Task { [weak self] in
            guard let self else { return }
            activityIndicatorView.startAnimating()
            image = await provider?.fetchImage()
            activityIndicatorView.stopAnimating()
        }
    }
}
