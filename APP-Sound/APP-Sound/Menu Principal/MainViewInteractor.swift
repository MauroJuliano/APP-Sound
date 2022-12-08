import Foundation
import UIKit

protocol MainViewInterating {
    
}

class MainViewInteractor: MainViewInterating {
    
}

class MainViewCoordinator {
    var delegate: MainViewDelegate
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
    }
}

enum MainViewFactory {
    static func make(delegate: MainViewDelegate) -> UIViewController {
        let coordinator = MainViewCoordinator(delegate: delegate)
        let controller = MainViewController()
        
        return controller
    }
}

