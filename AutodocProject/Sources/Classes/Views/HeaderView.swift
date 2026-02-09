import Foundation
import UIKit

final class HeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = .zero
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let bubbleView: BubbleView = {
        let label = BubbleView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, bubbleView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, horizontalStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    var title: String? {
        set { titleLabel.text = newValue }
        get { titleLabel.text }
    }
    
    var subtitle: String? {
        set { subtitleLabel.text = newValue }
        get { subtitleLabel.text }
    }
    
    var date: String? {
        set { dateLabel.text = newValue }
        get { dateLabel.text }
    }
    
    var category: String? {
        set { bubbleView.title = newValue }
        get { bubbleView.title }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    private func configureUI() {
        addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
}
