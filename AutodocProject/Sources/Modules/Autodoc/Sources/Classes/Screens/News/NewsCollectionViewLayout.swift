import Foundation
import UIKit

final class NewsCollectionViewLayout: UICollectionViewCompositionalLayout {
    
    private enum Constants {
        static let oneSecondWidth: CGFloat = 1 / 2
        static let oneThirdWidth: CGFloat = 1 / 3
        enum CollectionLayoutSection {
            static let interGroupSpacing: CGFloat = 16
            static let contentInsets = NSDirectionalEdgeInsets(
                top: 16,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        }
        enum CollectionLayoutGroup {
            static let interItemSpacing: CGFloat = 16
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        let item = NSCollectionLayoutItem(layoutSize: Self.layoutSizeItem())
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: Self.layoutSizeGroup(),
            repeatingSubitem: item,
            count: Self.repeatingCount()
        )
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(Constants.CollectionLayoutGroup.interItemSpacing)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Constants.CollectionLayoutSection.interGroupSpacing
        section.contentInsets = Constants.CollectionLayoutSection.contentInsets
        
        super.init(section: section)
    }
    
    private static func layoutSizeItem() -> NSCollectionLayoutSize {
        if UIDevice.isPhone {
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(1)
            )
        }
        let width: CGFloat = UIDevice.isPortrait ? Constants.oneSecondWidth : Constants.oneThirdWidth
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(width),
            heightDimension: .fractionalHeight(1)
        )
    }
    
    private static func layoutSizeGroup() -> NSCollectionLayoutSize {
        if UIDevice.isPhone {
            return NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(1)
            )
        }
        return NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.4)
        )
    }
    
    private static func repeatingCount() -> Int {
        if UIDevice.isPhone {
            return 1
        }
        return UIDevice.isPortrait ? 2 : 3
    }
}
