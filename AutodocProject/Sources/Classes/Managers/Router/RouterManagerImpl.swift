import SafariServices
import Foundation
import UIKit

struct RouterManagerImpl: RouterManager {
    
    @MainActor
    private var rootViewController: UINavigationController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first { $0.isKeyWindow }
        let rootViewController = window?.rootViewController as? UINavigationController
        return rootViewController
    }
    
    func open(url: URL) {
        Task {
            await openSafari(url: url)
        }
    }
    
    @MainActor
    private func openSafari(url: URL) {
        let viewController = SFSafariViewController(url: url)
        rootViewController?.pushViewController(viewController, animated: true)
    }
}
