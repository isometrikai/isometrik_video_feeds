import UIKit

protocol ISMConfig {
    func openProfile()
    func openCoins()
}

enum Flow {
    case reels
    case feeds
    case twitter
}

class Config {
    var delegate: ISMConfig?
    var flow: Flow?
    weak var parentViewController: UIViewController?

    init(delegate: ISMConfig? = nil, flow: Flow? = nil, parentViewController: UIViewController? = nil) {
        self.delegate = delegate
        self.flow = flow
        self.parentViewController = parentViewController
    }

    func setup() {
        guard let flow = flow, let parentVC = parentViewController else { return }

        switch flow {
        case .feeds:
            break
        case .reels:
            let reelsVC = ISMReelsViewController()
            reelsVC.configDelegate = parentVC as? any ISMConfig
            add(childVC: reelsVC, to: parentVC)
        case .twitter:
            // Add twitter-specific functionality
            break
        }
    }

    private func add(childVC: UIViewController, to parentVC: UIViewController) {
        parentVC.addChild(childVC)
        childVC.view.frame = parentVC.view.bounds
        parentVC.view.addSubview(childVC.view)
        childVC.didMove(toParent: parentVC)
    }
}
