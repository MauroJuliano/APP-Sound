import UIKit

protocol PlayerViewCoordinating {
    func perform(action: MainViewAction)
}

class PlayerViewCoordinator: PlayerViewCoordinating {
    var delegate: MainViewDelegate
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
    }
    
    func perform(action: MainViewAction) {
        delegate.perform(action: action)
    }
}
