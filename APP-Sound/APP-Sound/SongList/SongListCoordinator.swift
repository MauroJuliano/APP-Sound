import UIKit

protocol SongListCoordinating {
    func player(action: MainViewAction)
}

class SongListCoordinator: SongListCoordinating {
    var delegate: MainViewDelegate
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
    }
    
    func player(action: MainViewAction) {
        delegate.perform(action: action)
    }
}
